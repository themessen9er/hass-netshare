#!/usr/bin/env bashio
set -e

bashio::log.info "Creating rules..."
exec iptables --table nat --append POSTROUTING --out-interface wlan0 -j MASQUERADE
exec iptables --append FORWARD --in-interface wlan0 -j ACCEPT
exec iptables --append FORWARD --in-interface eth0 -j ACCEPT
bashio::log.info "Done"