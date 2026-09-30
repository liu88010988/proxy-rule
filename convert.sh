#!/bin/bash

./mihomo-mac convert-ruleset domain text meta/geosite/direct.list meta/geosite/direct.mrs
./mihomo-mac convert-ruleset domain text meta/geosite/proxy.list meta/geosite/proxy.mrs
./mihomo-mac convert-ruleset domain text meta/geosite/fakeip-filter-lite.list meta/geosite/fakeip-filter-lite.mrs
./mihomo-mac convert-ruleset ipcidr text meta/geoip/proxy.list meta/geoip/proxy.mrs
./mihomo-mac convert-ruleset ipcidr text meta/geoip/direct.list meta/geoip/direct.mrs

./sing-box-mac rule-set compile sing/geosite/geosite-my-direct.json
./sing-box-mac rule-set compile sing/geosite/geosite-my-proxy.json
./sing-box-mac rule-set compile sing/geosite/geosite-my-fakeip-filter-lite.json
./sing-box-mac rule-set compile sing/geoip/geoip-my-proxy.json
./sing-box-mac rule-set compile sing/geoip/geoip-my-direct.json
./rocket-real-ip.sh
