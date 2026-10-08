#!/bin/bash

./mihomo-mac convert-ruleset domain text meta/geosite/geosite-my-direct.list meta/geosite/geosite-my-direct.mrs
./mihomo-mac convert-ruleset domain text meta/geosite/geosite-my-proxy.list meta/geosite/geosite-my-proxy.mrs
./mihomo-mac convert-ruleset domain text meta/geosite/geosite-my-server.list meta/geosite/geosite-my-server.mrs
./mihomo-mac convert-ruleset domain text meta/geosite/geosite-my-fakeip-filter-lite.list meta/geosite/geosite-my-fakeip-filter-lite.mrs
./mihomo-mac convert-ruleset ipcidr text meta/geoip/geoip-my-proxy.list meta/geoip/geoip-my-proxy.mrs
./mihomo-mac convert-ruleset ipcidr text meta/geoip/geoip-my-direct.list meta/geoip/geoip-my-direct.mrs

./sing-box-mac rule-set compile sing/geosite/geosite-my-direct.json
./sing-box-mac rule-set compile sing/geosite/geosite-my-proxy.json
./sing-box-mac rule-set compile sing/geosite/geosite-my-server.json
./sing-box-mac rule-set compile sing/geosite/geosite-my-fakeip-filter-lite.json
./sing-box-mac rule-set compile sing/geoip/geoip-my-proxy.json
./sing-box-mac rule-set compile sing/geoip/geoip-my-direct.json
bash rocket/rocket-real-ip.sh
