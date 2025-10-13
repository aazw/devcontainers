#!/bin/bash

set -eu

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
cd "${SCRIPT_DIR}"

# imgaes/baseをビルド
echo "building images/base"
docker build -t devcontainer-base ./.devcontainer/
docker tag devcontainer-base ghcr.io/aazw/devcontainers/base:latest

LATEST_NUMBER_TAG=$(curl -s "https://ghcr.io/token?scope=repository:aazw/devcontainers/base:pull" |
	jq -r .token |
	xargs -I {} curl -s -H "Authorization: Bearer {}" \
		https://ghcr.io/v2/aazw/devcontainers/base/tags/list |
	jq -r '.tags[] | select(test("^[0-9]+$"))' | sort -V | tail -1)
docker tag devcontainer-base ghcr.io/aazw/devcontainers/base:${LATEST_NUMBER_TAG}
