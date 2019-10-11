#!/bin/bash

# Monitors on DP-2.2 and DP-0.1
left_mon_connected=$(xrandr -q | grep -qE '^DP-1 connected')
right_mon_connected=$(xrandr -q | grep -qE '^DP-1-4 connected')
script_path="~/.config/i3/"
startup_delay=3

#if $left_mon_connected && $right_mon_connected ; then
#    sleep $startup_delay
#    $script_path/triple.sh
#else
#    sleep $startup_delay
#    $script_path/single.sh
#fi

feh --bg-fill ~/Pictures/dover_sunset_in_august.jpg

