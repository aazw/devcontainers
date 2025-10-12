#!/bin/bash

# プロジェクトルートへ移動
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
cd "${SCRIPT_DIR}/.."

# 環境変数RENOVATE_GITHUB_COM_TOKENの設定チェック
if [[ -z "${RENOVATE_GITHUB_COM_TOKEN:-}" ]]; then
	echo "Error: RENOVATE_GITHUB_COM_TOKEN environment variable is not set" >&2
	echo "Please set the GitHub token for Renovate to access repositories" >&2
	exit 1
fi

# bashスクリプトの設定: 未定義変数使用時にエラー、パイプライン失敗時にエラー
# renovateはアップデートがあるとexit 1を返すため、set -eをするとrenovateでスクリプトが停止するため-eはつけない
set -uo pipefail

# 一時ファイルの作成とクリーンアップの設定
temp_file=$(mktemp)
trap "rm -f '${temp_file}'" EXIT

# renovateの実行: ローカルでドライランを実行し、結果をファイルに出力
export RENOVATE_PLATFORM=local
export RENOVATE_DRY_RUN=full
export RENOVATE_REPORT_TYPE=file
export RENOVATE_REPORT_PATH="${temp_file}"
LOG_LEVEL=debug renovate

# レポートファイルの内容を解析し、TSV形式で出力
echo ""
cat "${RENOVATE_REPORT_PATH}" | jq -r '
  (["File", "DataSource", "Package", "Type", "Current", "New"] | @tsv),
  (["----------", "----------", "----------", "----------", "----------", "----------"] | @tsv),
  ([.repositories.local.packageFiles // {} | to_entries[] as {key: $fileType, value: $files} |
    $files[] as $file |
    $file.deps[]? as $dep |
    $dep.updates[]? as $update |
    [$file.packageFile, $dep.datasource, $dep.depName, $update.updateType, $dep.currentValue, $update.newValue]
   ] | unique | sort_by(.[0], .[1], .[2])[] | @tsv)
' | column -t
