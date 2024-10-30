#!/bin/sh

display_width=1920
display_height=1021

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

if [ $xpos -le $center_x ]; then
    swaymsg [con_id=__focused__ floating] move position 0 px $((ypos - 60)) px
    exit 1
fi

if [ $xpos -gt $center_x ]; then
    swaymsg [con_id=__focused__ floating] move position $center_x px $((ypos - 60)) px
    exit 1
fi
