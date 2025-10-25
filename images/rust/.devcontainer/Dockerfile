# debian version
# 10 (Buster)
# 11 (Bullseye)
# 12 (Bookworm) **now**
# 13 (Trixie)
# 14 (Forky)

# renovate: datasource=docker depName=debian packageName=debian versioning=docker
ARG DOCKER_DEBIAN_VERSION=bookworm

# renovate: datasource=docker depName=rust packageName=rust versioning=docker
ARG DOCKER_RUST_VERSION=1.90.0

# renovate: datasource=docker depName=ghcr.io/aazw/devcontainers/base packageName=ghcr.io/aazw/devcontainers/base
ARG DOCKER_AAZW_DEVCONTAINERS_BASE_VERSION=43

# for debian tools (apt-get)
# https://packages.debian.org/search?keywords=search
# renovate: datasource=deb depName=libc6-dev packageName=libc6-dev versioning=deb
ARG DEBIAN_LIBC6_DEV_VERSION=2.36-9+deb12u13
# renovate: datasource=deb depName=gcc packageName=gcc versioning=deb
ARG DEBIAN_GCC_VERSION=4:12.2.0-3

# rust
# https://hub.docker.com/_/rust
FROM rust:${DOCKER_RUST_VERSION} AS rust-builder

# main image
FROM ghcr.io/aazw/devcontainers/base:${DOCKER_AAZW_DEVCONTAINERS_BASE_VERSION}
USER root

# rust
# https://aton-kish.github.io/blog/post/2020/11/05/multi-runtime-docker/
ARG DEBIAN_LIBC6_DEV_VERSION
ARG DEBIAN_GCC_VERSION
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
        libc6-dev=${DEBIAN_LIBC6_DEV_VERSION} \
        gcc=${DEBIAN_GCC_VERSION} \
    && rm -rf /var/lib/apt/lists/*
COPY --from=rust-builder /usr/local/cargo /usr/local/cargo
COPY --from=rust-builder /usr/local/rustup /usr/local/rustup
ENV PATH=/usr/local/cargo/bin/:$PATH
ENV RUSTUP_HOME=/usr/local/rustup
RUN cargo --version \
    && rustup --version

USER vscode
ENV USER=vscode
