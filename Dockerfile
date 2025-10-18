FROM python:3.12-slim-bullseye as venv

ENV UV_VERSION=0.9.2
WORKDIR /app

ENV PATH=/venv/bin:$PATH  \
    VIRTUAL_ENV=/venv

COPY pyproject.toml uv.lock /app/
# Install uv
RUN python -m pip install uv==${UV_VERSION} && \
# Create project venv
    uv venv /venv && \
    uv sync --frozen --no-dev --no-install-project 


FROM python:3.12-slim-bullseye
ARG DEPLOYMENT_ENV=BUILD

# Required geo spatial library
RUN apt-get update && \
    apt-get install -y --no-install-recommends gdal-bin

COPY --from=venv /venv /venv
COPY . /app
WORKDIR /app

ENV PATH=/venv/bin:$PATH \
    VIRTUAL_ENV=/venv \
    DEPLOYMENT_ENV=PROD \
    OTEL_EXPORTER_OTLP_ENDPOINT=https://otlp.eu01.nr-data.net \
    OTEL_SERVICE_NAME=jolpica-f1

EXPOSE 5000
CMD [ "python", "-m", "gunicorn", "--config", "gunicorn.conf.py"]
