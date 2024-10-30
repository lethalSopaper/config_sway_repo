#!/bin/sh

sleep 0.5

current_refresh=$(swaymsg -t get_outputs | jq -r '.[] | select(.name == "eDP-1") | .current_mode.refresh')

if [ "$current_refresh" -eq 144063 ]; then
    swaymsg output eDP-1 mode 1920x1080@60.061Hz
    notify-send -u normal "Display Mode" "Switched to 1920x1080@60.061Hz"
else
    swaymsg output eDP-1 mode 1920x1080@144.063Hz
    notify-send -u normal "Display Mode" "Switched to 1920x1080@144.063Hz"
fi
