#!/usr/bin/env bash

set -u

failures=0
results=()
labels=()
logs=()
direct_failures=()
log_dir="$(mktemp -d)"
trap 'rm -rf "$log_dir"' EXIT

record_failure() {
  direct_failures+=("$1")
  failures=$((failures + 1))
}

require_path() {
  local path="$1"
  if [ ! -e "$path" ]; then
    record_failure "$path が見つかりません"
  fi
}

run_check() {
  local label="$1"
  shift
  local index="${#labels[@]}"
  local log="$log_dir/$index.log"
  local status=0
  labels+=("$label")
  logs+=("$log")
  echo "実行: $label"
  "$@" >"$log" 2>&1 || status=$?
  results+=("$status")
  if [ "$status" -eq 0 ]; then
    echo "成功: $label"
  else
    echo "失敗: $label (終了コード=$status)"
    failures=$((failures + 1))
  fi
}

require_path "AGENTS.md"
require_path "README.md"
require_path "検証.sh"
require_path "開発/検証.md"
require_path "開発/作業管理.md"
require_path "リリース/方針.md"
require_path "skills/release/SKILL.md"
require_path ".github/workflows/release.yml"

if [ -f "検証.sh" ]; then
  run_check "プロダクト検証" bash ./検証.sh
fi

if [ "${#labels[@]}" -gt 0 ]; then
  echo
  echo "=== リリース検証結果 ==="
  for i in "${!labels[@]}"; do
    if [ "${results[$i]}" -eq 0 ]; then
      echo "成功 ${labels[$i]}"
    else
      echo "失敗 ${labels[$i]} (終了コード=${results[$i]})"
    fi
  done
fi

if [ "$failures" -ne 0 ]; then
  echo
  echo "=== 失敗した検査 ==="
  for message in "${direct_failures[@]}"; do
    echo "::error::$message"
  done
  for i in "${!labels[@]}"; do
    if [ "${results[$i]}" -ne 0 ]; then
      echo
      echo "--- ${labels[$i]} ---"
      cat "${logs[$i]}"
      echo "::error::${labels[$i]} が終了コード=${results[$i]} で失敗しました"
    fi
  done
  exit 1
fi

echo
echo "リリース検証成功"
