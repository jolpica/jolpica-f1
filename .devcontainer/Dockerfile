FROM mcr.microsoft.com/devcontainers/python:1-3.12-bullseye

# Remove outdated Yarn repository to prevent GPG errors
USER root
RUN rm -f /etc/apt/sources.list.d/yarn.list

USER vscode

ENV UV_VERSION=0.11.2
ENV PYTHONUNBUFFERED=1

ENV VIRTUAL_ENV=/home/vscode/.venv
ENV UV_PROJECT_ENVIRONMENT=${VIRTUAL_ENV}
ENV PATH=$VIRTUAL_ENV/bin:/home/vscode/.local/bin:$PATH
WORKDIR /workspaces/jolpica-f1

# Install UV
RUN curl -LsSf https://astral.sh/uv/${UV_VERSION}/install.sh | sh
