# debian version
# 10 (Buster)
# 11 (Bullseye)
# 12 (Bookworm) **now**
# 13 (Trixie)
# 14 (Forky)

# renovate: datasource=docker depName=debian packageName=debian versioning=docker
ARG DOCKER_DEBIAN_VERSION=bookworm

# renovate: datasource=docker depName=ghcr.io/aazw/devcontainers/base packageName=ghcr.io/aazw/devcontainers/base
ARG DOCKER_AAZW_DEVCONTAINERS_BASE_VERSION=43

# for pip tools
# renovate: datasource=pypi depName=wheel packageName=wheel
ARG PIP_WHEEL_VERSION=0.45.1
# renovate: datasource=pypi depName=uv packageName=uv
ARG PIP_UV_VERSION=0.9.7
# renovate: datasource=pypi depName=ruff packageName=ruff
ARG PIP_RUFF_VERSION=0.14.3

# main image
FROM ghcr.io/aazw/devcontainers/base:${DOCKER_AAZW_DEVCONTAINERS_BASE_VERSION}
USER root

# wheel
# https://pypi.org/project/wheel/
ARG PIP_WHEEL_VERSION
RUN pip install wheel==${PIP_WHEEL_VERSION} \
    && wheel version

# uv
# https://github.com/astral-sh/uv
# https://pypi.org/project/uv/
ARG PIP_UV_VERSION
RUN pip install uv==${PIP_UV_VERSION} \
    && uv --version

# ruff
# https://github.com/astral-sh/ruff
ARG PIP_RUFF_VERSION
RUN pip install ruff==${PIP_RUFF_VERSION} \
    && ruff --version

USER vscode
