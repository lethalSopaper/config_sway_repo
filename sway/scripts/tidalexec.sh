#!/bin/bash

if swaymsg -t get_workspaces | jq -e '.[] | select(.name == "Music" and .focused == true)'; then
    swaymsg workspace Music
else
    swaymsg workspace Music
    exec --no-startup-id easyeffects &
    exec --no-startup-id tidal &
    swaymsg layout tabbed
fi
