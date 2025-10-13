from __future__ import annotations

from typing import Any, Literal, get_args, get_origin

import pydantic
from drf_spectacular.types import OpenApiTypes
from drf_spectacular.utils import OpenApiExample, OpenApiParameter
from pydantic.fields import FieldInfo
from rest_framework.exceptions import ValidationError


def pydantic_to_open_api_parameters(
    model: type[pydantic.BaseModel],
    location: Literal["query", "path", "header", "cookie"] = OpenApiParameter.QUERY,
) -> list[OpenApiParameter]:
    """Convert a Pydantic model to a list of OpenApiParameter objects.

    Args:
        model: The Pydantic model class to convert
        location: Where the parameters are located (QUERY, PATH, HEADER, COOKIE)

    Returns:
        List of OpenApiParameter objects suitable for use in @extend_schema
    """
    parameters = []

    for field_name, field_info in model.model_fields.items():
        param = _create_open_api_parameter(field_name, field_info, location)
        parameters.append(param)

    return parameters


def _create_open_api_parameter(
    field_name: str,
    field_info: FieldInfo,
    location: Literal["query", "path", "header", "cookie"],
) -> OpenApiParameter:
    """Create a single OpenApiParameter from a Pydantic field."""
    # Get the field type and check if it's optional
    field_type = field_info.annotation
    is_optional = _is_optional_type(field_type)
    base_type = _get_base_type(field_type)

    # Map Python type to OpenApiTypes
    openapi_type = _map_python_type_to_openapi(base_type)

    # Extract description and enhance with constraints
    description = field_info.description or ""
    description = _add_constraints_to_description(description, field_info)

    # Get example values and convert to OpenApiExample
    examples = _get_example_values(field_name, field_info)

    # Determine if required
    required = not is_optional and field_info.default is None and not field_info.is_required()

    param = OpenApiParameter(
        name=field_name,
        type=openapi_type,
        default=field_info.default,
        location=location,
        description=description,
        required=required,
        examples=examples,
    )

    return param


def _is_optional_type(annotation: Any) -> bool:
    """Check if a type annotation is Optional (Union with None)."""
    origin = get_origin(annotation)
    if origin is not None:
        # Check for Union types
        args = get_args(annotation)
        return type(None) in args
    return False


def _get_base_type(annotation: Any) -> type:
    """Extract the base type from Optional or Union types."""
    origin = get_origin(annotation)
    if origin is not None:
        args = get_args(annotation)
        # Filter out NoneType and get the first actual type
        non_none_types = [arg for arg in args if arg is not type(None)]
        if non_none_types:
            return non_none_types[0]
    return annotation


def _map_python_type_to_openapi(python_type: type) -> OpenApiTypes:
    """Map Python types to OpenApiTypes."""
    type_mapping = {
        str: OpenApiTypes.STR,
        int: OpenApiTypes.INT,
        float: OpenApiTypes.NUMBER,
        bool: OpenApiTypes.BOOL,
    }
    return type_mapping.get(python_type, OpenApiTypes.STR)


def _add_constraints_to_description(description: str, field_info: FieldInfo) -> str:
    """Add constraint information to the description."""
    constraints = []

    metadata = field_info.metadata
    for meta in metadata:
        if hasattr(meta, "ge") and meta.ge is not None:
            constraints.append(f"min: {meta.ge}")
        if hasattr(meta, "gt") and meta.gt is not None:
            constraints.append(f"greater than: {meta.gt}")
        if hasattr(meta, "le") and meta.le is not None:
            constraints.append(f"max: {meta.le}")
        if hasattr(meta, "lt") and meta.lt is not None:
            constraints.append(f"less than: {meta.lt}")

    if constraints:
        constraint_str = " (" + ", ".join(constraints) + ")"
        return description + constraint_str if description else constraint_str.strip(" ()")

    return description


def _get_example_values(field_name: str, field_info: FieldInfo) -> list[OpenApiExample] | None:
    """Extract example values from field info and convert to OpenApiExample objects."""
    if not field_info.examples:
        return None

    examples_list = []

    # Handle both single examples and lists
    raw_examples = field_info.examples if isinstance(field_info.examples, list) else [field_info.examples]

    for idx, example_value in enumerate(raw_examples):
        # Create a descriptive name for the example
        example_name = f"{field_name}_example_{idx + 1}" if len(raw_examples) > 1 else f"{field_name}_example"

        examples_list.append(OpenApiExample(name=example_name, value=example_value))

    return examples_list if examples_list else None


def get_pagination_param_names(pagination_class: type | None) -> set[str]:
    """Extract pagination parameter names from a DRF pagination class.

    Args:
        pagination_class: DRF pagination class (e.g., PageNumberPagination)

    Returns:
        Set of pagination parameter names
    """
    if not pagination_class:
        return set()

    param_names = set()

    # Check for page parameter (default is 'page')
    if hasattr(pagination_class, "page_query_param"):
        page_param = pagination_class.page_query_param
        if page_param:
            param_names.add(page_param)
    else:
        param_names.add("page")  # DRF default

    # Check for page_size parameter (default is None for PageNumberPagination)
    if hasattr(pagination_class, "page_size_query_param"):
        size_param = pagination_class.page_size_query_param
        if size_param:
            param_names.add(size_param)

    return param_names


def validate_query_params[T: pydantic.BaseModel](
    query_params: dict,
    model: type[T],
    pagination_class: type | None = None,
) -> T:
    """Validate query parameters using a Pydantic model, excluding pagination params.

    Args:
        query_params: DRF request.query_params (QueryDict)
        model: Pydantic model for validation
        pagination_class: Optional DRF pagination class to exclude its parameters

    Returns:
        Validated Pydantic model instance

    Raises:
        ValidationError: DRF ValidationError with formatted error messages
    """
    try:
        # Convert query params to dict, handling single values
        params = dict(query_params)
        params = {k: v[0] if isinstance(v, list) and len(v) == 1 else v for k, v in params.items()}

        # Exclude pagination parameters
        pagination_params = get_pagination_param_names(pagination_class)
        params = {k: v for k, v in params.items() if k not in pagination_params}

        return model.model_validate(params)
    except pydantic.ValidationError as ex:
        # Convert Pydantic errors to DRF ValidationError format
        errors = {str(error["loc"][0]): error["msg"] for error in ex.errors(include_url=False) if error["loc"]}
        raise ValidationError(detail=errors)
