ARG DOCKER_DEBIAN_VERSION=bookworm
ARG DOCKER_GOLANG_VERSION=1.25.1

# golang
# https://hub.docker.com/_/golang
FROM golang:${DOCKER_GOLANG_VERSION}-${DOCKER_DEBIAN_VERSION} AS golang-builder

# main image
FROM ghcr.io/aazw/devcontainers/base:latest

# golang
COPY --from=golang-builder /usr/local/go /usr/local/go
ENV PATH=/usr/local/go/bin/:$PATH
