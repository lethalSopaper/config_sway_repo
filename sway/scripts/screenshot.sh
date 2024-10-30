#!/bin/bash
grim ~/Pictures/Screenshots/screenshot-$(date +%Y-%m-%d-%H%M%S).png
notify-send -u low "SS" "Screen shot taken"
