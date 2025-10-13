# debian version
# 10 (Buster)
# 11 (Bullseye)
# 12 (Bookworm) **now**
# 13 (Trixie)
# 14 (Forky)

# renovate: datasource=docker depName=debian packageName=debian versioning=docker
ARG DOCKER_DEBIAN_VERSION=bookworm

# renovate: datasource=docker depName=mcr.microsoft.com/openjdk/jdk packageName=mcr.microsoft.com/openjdk/jdk versioning=docker
ARG DOCKER_JAVA_VERSION=21-ubuntu

# renovate: datasource=docker depName=ghcr.io/aazw/devcontainers/base packageName=ghcr.io/aazw/devcontainers/base
ARG DOCKER_AAZW_DEVCONTAINERS_BASE_VERSION=4

# java
# https://learn.microsoft.com/ja-jp/java/openjdk/containers#create-a-custom-java-runtime
FROM mcr.microsoft.com/openjdk/jdk:${DOCKER_JAVA_VERSION} as runtime-build

# Create a custom Java runtime
RUN $JAVA_HOME/bin/jlink \
    --add-modules java.base \
    --strip-debug \
    --no-man-pages \
    --no-header-files \
    --compress=2 \
    --output /javaruntime

# main image
FROM ghcr.io/aazw/devcontainers/base:${DOCKER_AAZW_DEVCONTAINERS_BASE_VERSION}
USER root

# java
# https://learn.microsoft.com/ja-jp/java/openjdk/containers#create-a-custom-java-runtime
ENV LANG=en_US.UTF-8
ENV JAVA_HOME=/usr/lib/jvm/msopenjdk
ENV PATH="${JAVA_HOME}/bin:${PATH}"
COPY --from=runtime-build /javaruntime $JAVA_HOME

USER vscode
