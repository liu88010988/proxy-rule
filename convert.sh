#!/bin/bash

./mihomo-mac convert-ruleset domain text geosite/direct.list geosite/direct.mrs
./mihomo-mac convert-ruleset domain text geosite/proxy.list geosite/proxy.mrs
./mihomo-mac convert-ruleset ipcidr text geoip/proxy.list geoip/proxy.mrs
