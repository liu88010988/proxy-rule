#!/bin/bash

./mihomo-mac convert-ruleset domain text meta/geosite/direct.list meta/geosite/direct.mrs
./mihomo-mac convert-ruleset domain text meta/geosite/proxy.list meta/geosite/proxy.mrs
./mihomo-mac convert-ruleset ipcidr text meta/geoip/proxy.list meta/geoip/proxy.mrs
./mihomo-mac convert-ruleset ipcidr text meta/geoip/direct.list meta/geoip/direct.mrs

./sing-box-mac rule-set compile sing/geosite/direct.json
./sing-box-mac rule-set compile sing/geosite/proxy.json
./sing-box-mac rule-set compile sing/geoip/proxy.json
./sing-box-mac rule-set compile sing/geoip/direct.json
