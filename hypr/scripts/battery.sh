#!/usr/bin/env bash
bat=$(ls -d /sys/class/power_supply/BAT* 2>/dev/null | head -n1)
[ -z "$bat" ] && exit 0   # no battery (desktop): prints nothing

cap=$(cat "$bat/capacity")
status=$(cat "$bat/status")

icons=($'\U000f008e' $'\U000f007a' $'\U000f007b' $'\U000f007c' $'\U000f007d' \
       $'\U000f007e' $'\U000f007f' $'\U000f0080' $'\U000f0081' $'\U000f0082' $'\U000f0079')

if [ "$status" = "Charging" ]; then
    icon=$'\U000f0084'
else
    icon=${icons[$((cap / 10))]}
fi

echo "$icon $cap%"