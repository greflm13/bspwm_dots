#!/bin/bash

MENU="$(echo "" | dmenu -p "Volume" -nb '#08090c' -nf '#f6f6f6' -sb '#08090c' -sf '#f6f6f6')"
pactl set-sink-volume @DEFAULT_SINK@ "$MENU"%
