FROM mcr.microsoft.com/devcontainers/python:1-3.12-bullseye

ENV UV_VERSION=0.9.2
ENV PYTHONUNBUFFERED 1

ENV VIRTUAL_ENV=/home/vscode/.venv
ENV PATH=$VIRTUAL_ENV/bin:/root/.local/bin:$PATH
#ENV UV_VIRTUALENVS_CREATE=false

USER vscode
RUN pip install pipx && \
    pipx install uv==${UV_VERSION} && \
    python -m venv ${VIRTUAL_ENV}

WORKDIR /workspaces/jolpica-f1
# COPY pyproject.toml poetry.lock jolpica/ ./
# RUN poetry install --no-root
# [Optional] If your requirements rarely change, uncomment this section to add them to the image.
# COPY requirements.txt /tmp/pip-tmp/
# RUN pip3 --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
#    && rm -rf /tmp/pip-tmp



