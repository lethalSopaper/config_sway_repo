#!/bin/sh

USERNAME=$(whoami)
IMAGE_DIR="$HOME/.config/sway/img"
USER_IMAGE="$IMAGE_DIR/$USERNAME"
echo "$USER_IMAGE"
FALLBACK_IMAGE="$IMAGE_DIR/alternative"

if [ -f "$USER_IMAGE" ]; then
    echo "lol"
    swaymsg output "*" bg "$USER_IMAGE" fill
else
    echo "por"
    swaymsg output "*" bg "$FALLBACK_IMAGE" fill
fi
