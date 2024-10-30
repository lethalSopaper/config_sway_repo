#!/bin/bash

USERNAME=$(whoami)
IMAGE_DIR="~/.config/sway/img"
USER_IMAGE="$IMAGE_DIR/$USERNAME"
FALLBACK_IMAGE="$IMAGE_DIR/alternative"

if [[ -f "$USER_IMAGE" ]]; then
    swaymsg output "*" bg "$USER_IMAGE" fill
else
    swaymsg output "*" bg "$FALLBACK_IMAGE" fill
fi
