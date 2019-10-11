#!/bin/bash

rightmon_args="--mode 1920x1200 --pos 1920x300 --rotate normal"
leftmon_args="--mode 1920x1200 --pos 0x0 --rotate normal"

if $(xrandr -q | grep -q DP-0.1); then
    rightmon="DP-1-4"
    leftmon="DP-1"
else
    rightmon="DP-1-4"
    leftmon="DP-1"
fi

xrandr --addmode DP-1 1920x1200
xrandr --addmode DP-1-4 1920x1200
#xrandr --addmode DP-2.2 1920x1200
#xrandr --addmode DP-2 1920x1200

xrandr \
    --output eDP-1 --primary --auto \
    --output $rightmon --auto --right-of $leftmon \
    --output $leftmon --auto --right-of eDP-1
#
#    --output HDMI-0 --off \
#    --output DP-6 --off \
#    --output DP-5 --off \
#    --output DP-3 --off \
