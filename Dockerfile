FROM python:3.11-bullseye
ARG DEPLOYMENT_ENV=BUILD

# Required geo spatial librarie
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        binutils libproj-dev gdal-bin

COPY . /app
WORKDIR /app

ENV POETRY_VIRTUALENVS_CREATE=false
RUN pip install poetry && \
    poetry install --only=main --no-root && \
    python manage.py collectstatic --no-input

ENV DEPLOYMENT_ENV=PROD
EXPOSE 5000
CMD ["python", "-m", "gunicorn", "formulastat.asgi:application", "--bind=0.0.0.0:5000", "-k", "uvicorn.workers.UvicornWorker"]