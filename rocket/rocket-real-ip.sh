#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
output="$script_dir/always-real-ip.conf"
files=("$script_dir/geosite/geosite-my-direct.list" "$script_dir/geosite/geosite-my-fakeip-filter-lite.list")

result=$(
  sed -n \
    -e 's/^DOMAIN,//p' \
    -e 's/^DOMAIN-SUFFIX,/*./p' \
    "${files[@]}" |
    awk '{printf "%s%s", (NR > 1 ? ", " : ""), $0}'
)
echo "always-real-ip = $result" >"$output"
