#!/bin/bash

output="rocket/always-real-ip.conf"
files=("rocket/geosite/geosite-my-direct.list" "rocket/geosite/geosite-my-fakeip-filter-lite.list")

result=$(
  sed -n \
    -e 's/^DOMAIN,//p' \
    -e 's/^DOMAIN-SUFFIX,/*./p' \
    "${files[@]}" |
    awk '{printf "%s%s", (NR > 1 ? ", " : ""), $0}'
)
echo "always-real-ip = $result" >"$output"
