# debian version
# 10 (Buster)
# 11 (Bullseye)
# 12 (Bookworm) **now**
# 13 (Trixie)
# 14 (Forky)

# renovate: datasource=docker depName=debian packageName=debian versioning=docker
ARG DOCKER_DEBIAN_VERSION=bookworm

# renovate: datasource=docker depName=swift packageName=swift versioning=docker
ARG DOCKER_SWIFT_VERSION=6.2.0

# renovate: datasource=docker depName=ghcr.io/aazw/devcontainers/base packageName=ghcr.io/aazw/devcontainers/base
ARG DOCKER_AAZW_DEVCONTAINERS_BASE_VERSION=42

# for debian tools (apt-get)
# https://packages.debian.org/search?keywords=search
# renovate: datasource=deb depName=libicu72 packageName=libicu72 versioning=deb
ARG DEBIAN_LIBICU72_VERSION=72.1-3+deb12u1
# renovate: datasource=deb depName=libcurl4 packageName=libcurl4 versioning=deb
ARG DEBIAN_LIBCURL4_VERSION=7.88.1-10+deb12u14
# renovate: datasource=deb depName=libxml2 packageName=libxml2 versioning=deb
ARG DEBIAN_LIBXML2_VERSION=2.9.14+dfsg-1.3~deb12u4
# renovate: datasource=deb depName=libc6-dev packageName=libc6-dev versioning=deb
ARG DEBIAN_LIBC6_DEV_VERSION=2.36-9+deb12u13
# renovate: datasource=deb depName=binutils packageName=binutils versioning=deb
ARG DEBIAN_BINUTILS_VERSION=2.40-2
# renovate: datasource=deb depName=libncurses6 packageName=libncurses6 versioning=deb
ARG DEBIAN_LIBNCURSES6_VERSION=6.4-4
# renovate: datasource=deb depName=libtinfo6 packageName=libtinfo6 versioning=deb
ARG DEBIAN_LIBTINFO6_VERSION=6.4-4
# renovate: datasource=deb depName=libedit2 packageName=libedit2 versioning=deb
ARG DEBIAN_LIBEDIT2_VERSION=3.1-20221030-2
# renovate: datasource=deb depName=libsqlite3-0 packageName=libsqlite3-0 versioning=deb
ARG DEBIAN_LIBSQLITE3_0_VERSION=3.40.1-2+deb12u2
# renovate: datasource=deb depName=libz3-4 packageName=libz3-4 versioning=deb
ARG DEBIAN_LIBZ3_4_VERSION=4.8.12-3.1
# renovate: datasource=deb depName=clang packageName=clang versioning=deb
ARG DEBIAN_CLANG_VERSION=1:14.0-55.7~deb12u1

# swift
# https://hub.docker.com/_/swift
FROM swift:${DOCKER_SWIFT_VERSION}-${DOCKER_DEBIAN_VERSION} AS swift-builder

# swift
# https://hub.docker.com/_/swift
# 以下のCOPYを一つにまとめるようにしてCOPYコマンド数を削減
# # Swiftの実行可能ファイル
# COPY --from=swift-builder /usr/bin/swift* /usr/bin/
# COPY --from=swift-builder /usr/bin/repl_swift /usr/bin/
# # Swiftランタイムライブラリ
# COPY --from=swift-builder /usr/lib/swift /usr/lib/swift
# # 追加の共有ライブラリ
# COPY --from=swift-builder /usr/lib/libswiftDemangle.so /usr/lib/
# # 補助ツール
# COPY --from=swift-builder /usr/libexec/swift /usr/libexec/swift
# # ヘッダー（コンパイルする場合必要）
# COPY --from=swift-builder /usr/include/swift /usr/include/swift
RUN mkdir -p /swift-runtime/usr/bin \
    /swift-runtime/usr/lib \
    /swift-runtime/usr/libexec \
    /swift-runtime/usr/include \
    && cp -r /usr/bin/swift* /swift-runtime/usr/bin/ \
    && cp /usr/bin/repl_swift /swift-runtime/usr/bin/ \
    && cp -r /usr/lib/swift /swift-runtime/usr/lib/ \
    && cp /usr/lib/libswiftDemangle.so /swift-runtime/usr/lib/ \
    && cp -r /usr/libexec/swift /swift-runtime/usr/libexec/ \
    && cp -r /usr/include/swift /swift-runtime/usr/include/

# main image
FROM ghcr.io/aazw/devcontainers/base:${DOCKER_AAZW_DEVCONTAINERS_BASE_VERSION}
USER root

# Swiftの依存ライブラリをインストール
ARG DEBIAN_LIBICU72_VERSION
ARG DEBIAN_LIBCURL4_VERSION
ARG DEBIAN_LIBXML2_VERSION
ARG DEBIAN_LIBC6_DEV_VERSION
ARG DEBIAN_BINUTILS_VERSION
ARG DEBIAN_LIBNCURSES6_VERSION
ARG DEBIAN_LIBTINFO6_VERSION
ARG DEBIAN_LIBEDIT2_VERSION
ARG DEBIAN_LIBSQLITE3_0_VERSION
ARG DEBIAN_LIBZ3_4_VERSION
ARG DEBIAN_CLANG_VERSION
RUN apt-get update -y && apt-get install -y --no-install-recommends \
    libicu72=${DEBIAN_LIBICU72_VERSION} \
    libcurl4=${DEBIAN_LIBCURL4_VERSION} \
    libxml2=${DEBIAN_LIBXML2_VERSION} \
    libc6-dev=${DEBIAN_LIBC6_DEV_VERSION} \
    binutils=${DEBIAN_BINUTILS_VERSION} \
    libncurses6=${DEBIAN_LIBNCURSES6_VERSION} \
    libtinfo6=${DEBIAN_LIBTINFO6_VERSION} \
    libedit2=${DEBIAN_LIBEDIT2_VERSION} \
    libsqlite3-0=${DEBIAN_LIBSQLITE3_0_VERSION} \
    libz3-4=${DEBIAN_LIBZ3_4_VERSION} \
    clang=${DEBIAN_CLANG_VERSION} \
    && rm -rf /var/lib/apt/lists/*

# swift
# refs above
COPY --from=swift-builder /swift-runtime/usr /usr
ENV LD_LIBRARY_PATH=/usr/lib/swift/linux
# RUN swift --version && swift package --version

RUN git clone https://github.com/yonaskolb/XcodeGen.git

USER vscode
