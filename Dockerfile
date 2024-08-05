FROM python:3.12-slim-bullseye as venv

WORKDIR /app

ENV PATH=/venv/bin:/poetry/bin:$PATH \
    VIRTUAL_ENV=/venv

COPY pyproject.toml poetry.lock /app/
# Install poetry
RUN python -m venv /poetry && \
    /poetry/bin/python -m pip install poetry==1.8.3 && \
# Create project venv
    python -m venv /venv && \
    poetry install --only=main --no-root

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
CMD [ "python", "-m", "gunicorn", "jolpica_api.asgi:application", \
    "--bind=0.0.0.0:5000", \
    "--access-logfile=-", \
    "--logger-class=jolpica_api.logging.GunicornLogger", \
    "-k", "uvicorn.workers.UvicornWorker" \
]
