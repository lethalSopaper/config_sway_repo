#!/bin/sh

display_width=1920
display_height=1020

swaymsg [con_id=__focused__] floating toggle

window_info=( $(swaymsg -t get_tree | jq -r '.. | select(.type?) | select(.type=="floating_con") | select(.focused?) | .rect.width, .rect.height, .rect.x, .rect.y') )

if [ ${#window_info[@]} -eq 4 ]; then
    w_width=${window_info[0]}
    w_height=${window_info[1]}
    xpos=${window_info[2]}
    ypos=${window_info[3]}
else
    exit 1
fi

xfin=$(((display_width / 2) - (w_width / 2)))
yfin=$(((display_height / 2) - (w_height / 2)))

swaymsg [con_id=__focused__ floating] move position $xfin px $yfin px
