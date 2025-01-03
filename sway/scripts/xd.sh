swaymsg -t get_workspaces | jq -e '.[] | select(.name == "Music" and .focused == true)'
