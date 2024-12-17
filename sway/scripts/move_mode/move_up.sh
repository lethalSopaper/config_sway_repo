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

center_y=$(((display_height / 2) - (w_height / 2)))
piv=$(((ypos) - (60)))


if [ $piv -le $center_y ]; then
    swaymsg [con_id=__focused__ floating] move position $xpos px 0 px
    exit 1
fi

if [ $piv -gt $center_y ]; then
    swaymsg [con_id=__focused__ floating] move position $xpos px $center_y px
    exit 1
fi
