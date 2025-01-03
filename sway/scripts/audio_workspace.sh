#!/bin/bash

# First, see if the AUDIO workspace is already running
TIDAL=$(swaymsg -t get_tree | jq '.. | .app_id? | select(type == "string" and test("tidal-hifi"))')
EASYEFFECTS=$(swaymsg -t get_tree | jq '.. | .app_id? | select(type == "string" and test("easyeffects"))')

swaymsg workspace AUDIO
swaymsg layout tabbed
if [ -z "$TIDAL" ]; then
    flatpak run com.mastermindzh.tidal-hifi &
fi
if [ -z "$EASYEFFECTS" ]; then
    easyeffects &
fi