#!/bin/bash

OUTPUT="geosite/fakeip-filter.list"
URL="https://raw.githubusercontent.com/DustinWin/ruleset_geodata/sing-box-ruleset/fakeip-filter.json"

if ! command -v jq &>/dev/null; then
  echo "请先安装 jq (例如: apt install jq / brew install jq)"
  exit 1
fi

>"$OUTPUT"

curl -sL "$URL" | jq -r '
  .rules[]? |
  (.domain[]?        | "DOMAIN,\(.)"),
  (.domain_suffix[]? | "DOMAIN-SUFFIX,\(.)"),
  (.domain_keyword[]?| "DOMAIN-KEYWORD,\(.)"),
  (.domain_regex[]?  | "DOMAIN-REGEX,\(.)")
' >>"$OUTPUT"
