#!/bin/bash

IP_RULE_SET=("private" "google" "netflix" "telegram" "cn")
BASE_URL="https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/meta/geo"
FILTER_URL="https://raw.githubusercontent.com/DustinWin/ruleset_geodata/mihomo-ruleset"

for IP_SET in "${IP_RULE_SET[@]}"; do
  curl -s -L "$BASE_URL/geoip/$IP_SET.mrs" -o "geoip/$IP_SET.mrs"
  curl -s -L "$BASE_URL/geoip/$IP_SET.list" -o "geoip/$IP_SET.list"
  curl -s -L "$BASE_URL/geoip/classical/$IP_SET.list" -o "geoip/classical/$IP_SET.list"
done

DOMAIN_RULE_SET=("cn" "microsoft@cn" "apple" "google@cn" "private" "tld-cn" "category-games@cn" "category-ai-!cn" "github" "youtube" "google" "onedrive" "microsoft" "tiktok" "ookla-speedtest" "telegram" "netflix" "paypal" "gfw")

for DOMAIN_SET in "${DOMAIN_RULE_SET[@]}"; do
  curl -s -L "$BASE_URL/geosite/$DOMAIN_SET.mrs" -o "geosite/$DOMAIN_SET.mrs"
  curl -s -L "$BASE_URL/geosite/$DOMAIN_SET.list" -o "geosite/$DOMAIN_SET.list"
  curl -s -L "$BASE_URL/geosite/classical/$DOMAIN_SET.list" -o "geosite/classical/$DOMAIN_SET.list"
done

curl -s -L "$FILTER_URL/fakeip-filter.list" -o "geosite/fakeip-filter.list"
curl -s -L "$FILTER_URL/fakeip-filter.mrs" -o "geosite/fakeip-filter.mrs"
