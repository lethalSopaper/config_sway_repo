#!/bin/bash

sources=$(pactl list sources short | awk '{print $2}')

for source in $sources; do
  # Get the current mute status
  current_mute=$(pactl get-source-mute $source | awk '{print $2}')

  # Toggle mute status
  if [ "$current_mute" = "yes" ]; then
    pactl set-source-mute $source false
  else
    pactl set-source-mute $source true
  fi
done
