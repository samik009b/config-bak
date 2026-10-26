#!/bin/bash
if [ "$(nmcli radio wifi)" = "enabled" ]; then
    ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2- | sed 's/"/\\"/g')
    if [ -n "$ssid" ]; then
        echo "{\"text\":\"$ssid\",\"alt\":\"enabled\",\"tooltip\":\"Connected to $ssid\"}"
    else
        echo '{"text":"Not connected","alt":"enabled","tooltip":"WiFi on, not connected"}'
    fi
else
    echo '{"text":"Off","alt":"disabled","tooltip":"WiFi off"}'
fi