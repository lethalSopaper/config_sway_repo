#!/bin/sh

source=$(pactl get-default-source)

if [ -n "$source" ]; then
  pactl set-source-volume "$source" +5%
  echo "Microphone volume raised by 5%."
else
  echo "No active microphone found."
fi
