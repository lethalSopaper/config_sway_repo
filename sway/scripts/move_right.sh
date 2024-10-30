#!/bin/sh

display_width=1920
display_height=1020

window_info=( $(swaymsg -t get_tree | jq -r '.. | select(.type?) | select(.type=="floating_con") | select(.focused?) | .rect.width, .rect.height, .rect.x, .rect.y') )

if [ ${#window_info[@]} -eq 4 ]; then
    w_width=${window_info[0]}
    w_height=${window_info[1]}
    xpos=${window_info[2]}
    ypos=${window_info[3]}
else
    swaymsg mode "default"
    exit 1
fi

center_x=$(((display_width / 2) - (w_width / 2)))
right_x=$((display_width - w_width))

if [ $xpos -ge $center_x ]; then
    swaymsg [con_id=__focused__ floating] move position $right_x px $((ypos - 60)) px
    exit 1
fi

if [ $xpos -lt $center_x ]; then
    swaymsg [con_id=__focused__ floating] move position $center_x px $((ypos - 60)) px
    exit 1
fi
