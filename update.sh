#!/bin/bash

IP_RULE_SET=("private" "google" "netflix" "telegram")
BASE_URL="https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo"

for IP_SET in "${IP_RULE_SET[@]}"; do
  curl -s -L "$BASE_URL/geoip/classical/$IP_SET.list" -o "geoip/$IP_SET.list"
  sed -i 's/$/,no-resolve/' "geoip/$IP_SET.list"
done

curl -s -L "$BASE_URL/geoip/classical/cn.list" -o "geoip/cn.list"

DOMAIN_RULE_SET=("cn" "microsoft@cn" "apple" "google@cn" "private" "tld-cn" "category-games@cn" "category-ai-!cn" "github" "youtube" "google" "onedrive" "microsoft" "tiktok" "ookla-speedtest" "telegram" "netflix" "paypal" "gfw")

for DOMAIN_SET in "${DOMAIN_RULE_SET[@]}"; do
  curl -s -L "$BASE_URL/geosite/classical/$DOMAIN_SET.list" -o "geosite/$DOMAIN_SET.list"
done

chmod +x fakeip-filter.sh
./fakeip-filter.sh
