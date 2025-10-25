# debian version
# 10 (Buster)
# 11 (Bullseye)
# 12 (Bookworm) **now**
# 13 (Trixie)
# 14 (Forky)

# renovate: datasource=docker depName=debian packageName=debian versioning=docker
ARG DOCKER_DEBIAN_VERSION=bookworm

# renovate: datasource=docker depName=golang packageName=golang versioning=docker
ARG DOCKER_GOLANG_VERSION=1.25.2

# renovate: datasource=docker depName=ghcr.io/aazw/devcontainers/base packageName=ghcr.io/aazw/devcontainers/base
ARG DOCKER_AAZW_DEVCONTAINERS_BASE_VERSION=43

# golang
# https://hub.docker.com/_/golang
FROM golang:${DOCKER_GOLANG_VERSION}-${DOCKER_DEBIAN_VERSION} AS golang-builder

# main image
FROM ghcr.io/aazw/devcontainers/base:${DOCKER_AAZW_DEVCONTAINERS_BASE_VERSION}
USER root

# golang
COPY --from=golang-builder /usr/local/go /usr/local/go
ENV PATH=/usr/local/go/bin/:$PATH

USER vscode
