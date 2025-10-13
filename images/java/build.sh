#!/bin/bash

set -eu

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
cd "${SCRIPT_DIR}"

# imgaes/baseをビルド
echo "building images/base as ghcr.io/aazw/devcontainers/base:*"
./../base/build.sh

# imgaes/baseをローカル参照する形で、imgaes/javaをビルド
echo "" # 空行挿入
echo "building images/java with ghcr.io/aazw/devcontainers/base:latest"
docker build -t devcontainer-java ./.devcontainer/
