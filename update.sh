#!/bin/bash

IP_RULE_SET=("google" "netflix" "telegram" "cn")
BASE_URL="https://raw.githubusercontent.com/MetaCubeX/meta-rules-dat/sing/geo"
FILTER_URL="https://raw.githubusercontent.com/DustinWin/ruleset_geodata/sing-box-ruleset"

for IP_SET in "${IP_RULE_SET[@]}"; do
  curl -s -L "$BASE_URL/geoip/$IP_SET.srs" -o "geoip/$IP_SET.srs"
  curl -s -L "$BASE_URL/geoip/$IP_SET.json" -o "geoip/$IP_SET.json"
done

DOMAIN_RULE_SET=("geolocation-!cn" "cn" "microsoft@cn" "apple" "google@cn" "private" "tld-cn" "category-games@cn" "category-ai-!cn" "github" "youtube" "google" "onedrive" "microsoft" "tiktok" "ookla-speedtest" "telegram" "netflix" "paypal" "gfw")

for DOMAIN_SET in "${DOMAIN_RULE_SET[@]}"; do
  curl -s -L "$BASE_URL/geosite/$DOMAIN_SET.srs" -o "geosite/$DOMAIN_SET.srs"
  curl -s -L "$BASE_URL/geosite/$DOMAIN_SET.json" -o "geosite/$DOMAIN_SET.json"
done

curl -s -L "$FILTER_URL/fakeip-filter.srs" -o "geosite/fakeip-filter.srs"
curl -s -L "$FILTER_URL/fakeip-filter.json" -o "geosite/fakeip-filter.json"
