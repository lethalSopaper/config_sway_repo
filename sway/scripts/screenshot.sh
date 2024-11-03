#!/bin/bash
grim ~/Pictures/screenshots/screenshot-$(date +%Y-%m-%d-%H%M%S).png
notify-send -u low "SS" "Screen shot taken"
