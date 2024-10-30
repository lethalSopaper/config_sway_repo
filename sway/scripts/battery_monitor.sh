#!/bin/bash

LOW_BATTERY_THRESHOLD_20=20
LOW_BATTERY_THRESHOLD_10=10
notified_20=false
notified_10=false

while true; do
    BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)

    if [ "$BATTERY_LEVEL" -le "$LOW_BATTERY_THRESHOLD_20" ] && [ "$notified_20" = false ]; then
        notify-send -u normal "Low Battery" "Battery level is at ${BATTERY_LEVEL}%"
        notified_20=true
    fi

    if [ "$BATTERY_LEVEL" -le "$LOW_BATTERY_THRESHOLD_10" ] && [ "$notified_10" = false ]; then
        notify-send -h string:category:warning  "Critical Battery" "Battery level is at ${BATTERY_LEVEL}%"
        notified_10=true
    fi

    if [ "$BATTERY_LEVEL" -gt "$LOW_BATTERY_THRESHOLD_20" ]; then
        notified_20=false
        notified_10=false
    fi

    sleep 300
done
