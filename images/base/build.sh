#!/bin/bash

set -eu

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
cd "${SCRIPT_DIR}"

# imgaes/baseをビルド
echo "building images/base"
docker build -t devcontainer-base ./.devcontainer/
docker tag devcontainer-base ghcr.io/aazw/devcontainers/base:latest
