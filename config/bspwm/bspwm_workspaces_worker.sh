#!/bin/bash
autorandr -c
if [ "$(<~/.config/bspwm/lock)" != "lock" ]; then
    echo "lock" >~/.config/bspwm/lock
    sorted=$(xrandr -q | grep '\bconnected' | sed 's/primary//' | awk '{print $3}' | sed 's/.*+\(.*\)+.*/\1/' | sort)
    num="$(xrandr --query | grep -c '\bconnected')"
    if [ "$num" -eq "4" ]; then
        for MONITOR in $(xrandr --query | grep '\bconnected' | sed 's/ .*//'); do
            bspc monitor "$MONITOR" -a Desktop
        done
        for DESKTOP in 1 2 3; do
            bspc desktop $DESKTOP -m "$(xrandr -q | grep '\bconnected' | grep +"$(echo "$sorted" | sed -n '1p')"+ | awk '{print $1}')"
        done
        for DESKTOP in 4 5 6; do
            bspc desktop $DESKTOP -m "$(xrandr -q | grep '\bconnected' | grep +"$(echo "$sorted" | sed -n '2p')"+ | awk '{print $1}')"
        done
        for DESKTOP in 7 8 9; do
            bspc desktop $DESKTOP -m "$(xrandr -q | grep '\bconnected' | grep +"$(echo "$sorted" | sed -n '3p')"+ | awk '{print $1}')"
        done
        for DESKTOP in 10 11 12; do
            bspc desktop $DESKTOP -m "$(xrandr -q | grep '\bconnected' | grep +"$(echo "$sorted" | sed -n '4p')"+ | awk '{print $1}')"
        done
        for MONITOR in $(xrandr --query | grep disconnected | sed 's/ .*//'); do
            bspc monitor "$MONITOR" -r
        done
        for DESKTOP in $(bspc query -D --names | grep Desktop); do
            bspc desktop Desktop -r
        done
        for MONITOR in $(xrandr --query | grep '\bconnected' | sed 's/ .*//'); do
            bspc query -m "$MONITOR" -T | jq -r .desktops[].name | sort -n | xargs bspc monitor "$MONITOR" -o
        done
    elif [ "$num" -eq "3" ]; then
        for MONITOR in $(xrandr --query | grep '\bconnected' | sed 's/ .*//'); do
            bspc monitor "$MONITOR" -a Desktop
        done
        for DESKTOP in 1 2 3 4; do
            bspc desktop $DESKTOP -m "$(xrandr -q | grep '\bconnected' | grep +"$(echo "$sorted" | sed -n '1p')"+ | awk '{print $1}')"
        done
        for DESKTOP in 5 6 7 8; do
            bspc desktop $DESKTOP -m "$(xrandr -q | grep '\bconnected' | grep +"$(echo "$sorted" | sed -n '2p')"+ | awk '{print $1}')"
        done
        for DESKTOP in 9 10 11 12; do
            bspc desktop $DESKTOP -m "$(xrandr -q | grep '\bconnected' | grep +"$(echo "$sorted" | sed -n '3p')"+ | awk '{print $1}')"
        done
        for MONITOR in $(xrandr --query | grep disconnected | sed 's/ .*//'); do
            bspc monitor "$MONITOR" -r
        done
        for DESKTOP in $(bspc query -D --names | grep Desktop); do
            bspc desktop Desktop -r
        done
        for MONITOR in $(xrandr --query | grep '\bconnected' | sed 's/ .*//'); do
            bspc query -m "$MONITOR" -T | jq -r .desktops[].name | sort -n | xargs bspc monitor "$MONITOR" -o
        done
    elif [ "$num" -eq "2" ]; then
        for MONITOR in $(xrandr --query | grep '\bconnected' | sed 's/ .*//'); do
            bspc monitor "$MONITOR" -a Desktop
        done
        for DESKTOP in 1 2 3 4 5 6; do
            bspc desktop $DESKTOP -m "$(xrandr -q | grep '\bconnected' | grep +"$(echo "$sorted" | sed -n '1p')"+ | awk '{print $1}')"
        done
        for DESKTOP in 7 8 9 10 11 12; do
            bspc desktop $DESKTOP -m "$(xrandr -q | grep '\bconnected' | grep +"$(echo "$sorted" | sed -n '2p')"+ | awk '{print $1}')"
        done
        for MONITOR in $(xrandr --query | grep disconnected | sed 's/ .*//'); do
            bspc monitor "$MONITOR" -r
        done
        for DESKTOP in $(bspc query -D --names | grep Desktop); do
            bspc desktop Desktop -r
        done
        for MONITOR in $(xrandr --query | grep '\bconnected' | sed 's/ .*//'); do
            bspc query -m "$MONITOR" -T | jq -r .desktops[].name | sort -n | xargs bspc monitor "$MONITOR" -o
        done
    else
        for MONITOR in $(xrandr --query | grep '\bconnected' | sed 's/ .*//'); do
            bspc monitor "$MONITOR" -a Desktop
        done
        for DESKTOP in 1 2 3 4 5 6 7 8 9 10 11 12; do
            bspc desktop $DESKTOP -m "$(xrandr -q | grep '\bconnected' | grep +"$(echo "$sorted" | sed -n '1p')"+ | awk '{print $1}')"
        done
        for MONITOR in $(xrandr --query | grep disconnected | sed 's/ .*//'); do
            bspc monitor "$MONITOR" -r
        done
        for DESKTOP in $(bspc query -D --names | grep Desktop); do
            bspc desktop Desktop -r
        done
        for MONITOR in $(xrandr --query | grep '\bconnected' | sed 's/ .*//'); do
            bspc query -m "$MONITOR" -T | jq -r .desktops[].name | sort -n | xargs bspc monitor "$MONITOR" -o
        done
    fi
    ~/.config/bspwm/lockscreen &
    ~/.config/polybar/run.sh &
    sleep 2s
    echo "" >~/.config/bspwm/lock
fi
