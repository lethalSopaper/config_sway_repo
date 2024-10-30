#!/bin/sh

source=$(pactl get-default-source)

if [ -n "$source" ]; then
    pactl set-source-volume "$source" -5%
    echo "Microphone volume reduced by 5%."
else
    echo "No active microphone found."
fi

