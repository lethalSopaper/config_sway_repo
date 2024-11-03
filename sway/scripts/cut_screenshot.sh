#!/bin/bash
grim -g "$(slurp)" ~/Pictures/screenshots/screenshot-$(date +%Y-%m-%d-%H%M%S).png
notify-send -u low "SS" "Snipping shot taken"
