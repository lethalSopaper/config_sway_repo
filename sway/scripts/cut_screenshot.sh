#!/bin/bash
grim -g "$(slurp)" ~/Pictures/Screenshots/screenshot-$(date +%Y-%m-%d-%H%M%S).png
notify-send -u low "SS" "Snipping shot taken"