#!/bin/bash

LOW_BATTERY_THRESHOLD_20=20
LOW_BATTERY_THRESHOLD_10=10
NOTIFICATION_ICON_20="$HOME/.config/dunst/img/battery-level-20-symbolic.svg"
NOTIFICATION_ICON_10="$HOME/.config/dunst/img/battery-level-10-symbolic.svg"
notified_20=false
notified_10=false

while true; do
    BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)

    if [ "$BATTERY_LEVEL" -le "$LOW_BATTERY_THRESHOLD_20" ] && [ "$notified_20" = false ]; then
        notify-send -h string:bgcolor:#d4c400 -h string:fgcolor:#ffffff -h string:image-path:$NOTIFICATION_ICON_20 "Low Battery Level" "Battery level is at ${BATTERY_LEVEL}%"
        notified_20=true
    fi

    if [ "$BATTERY_LEVEL" -le "$LOW_BATTERY_THRESHOLD_10" ] && [ "$notified_10" = false ]; then
        notify-send -h string:bgcolor:#9e0000 -h string:fgcolor:#ffffff -h string:image-path:$NOTIFICATION_ICON_10 "Critical Battery Level" "Battery level is at ${BATTERY_LEVEL}%"
        notified_10=true
    fi

    if [ "$BATTERY_LEVEL" -gt "$LOW_BATTERY_THRESHOLD_20" ]; then
        notified_20=false
        notified_10=false
    fi

    sleep 300
done
