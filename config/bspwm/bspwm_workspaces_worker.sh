#!/bin/bash
autorandr -c
if [ "$(<~/.config/bspwm/lock)" != "lock" ]; then
    echo "lock" >~/.config/bspwm/lock
    sorted=$(xrandr -q | grep -E '\bconnected [[:digit:]]{1,4}x' | sed 's/primary//' | awk '{print $3}' | sed 's/.*+\(.*\)+.*/\1/' | sort)
    inactive=$(xrandr -q | grep -E '\bconnected ([[:alpha:]]+|\()' | sed 's/primary//' | awk '{print $1}' | sort)
    num="$(xrandr --query | grep -cE '\bconnected [[:digit:]]{1,4}x')"
    for MONITOR in $(xrandr --query | grep -E '\bconnected [[:digit:]]{1,4}x' | sed 's/ .*//'); do
        bspc monitor "$MONITOR" -a Desktop
    done
    if [ "$num" -eq "4" ]; then
        for DESKTOP in {1..3}; do
            bspc desktop "$DESKTOP" -m "$(xrandr -q | grep -E '\bconnected [[:digit:]]{1,4}x' | grep +"$(echo "$sorted" | sed -n '1p')"+ | awk '{print $1}')"
        done
        for DESKTOP in {4..6}; do
            bspc desktop "$DESKTOP" -m "$(xrandr -q | grep -E '\bconnected [[:digit:]]{1,4}x' | grep +"$(echo "$sorted" | sed -n '2p')"+ | awk '{print $1}')"
        done
        for DESKTOP in {7..9}; do
            bspc desktop "$DESKTOP" -m "$(xrandr -q | grep -E '\bconnected [[:digit:]]{1,4}x' | grep +"$(echo "$sorted" | sed -n '3p')"+ | awk '{print $1}')"
        done
        for DESKTOP in {10..12}; do
            bspc desktop "$DESKTOP" -m "$(xrandr -q | grep -E '\bconnected [[:digit:]]{1,4}x' | grep +"$(echo "$sorted" | sed -n '4p')"+ | awk '{print $1}')"
        done
    elif [ "$num" -eq "3" ]; then
        for DESKTOP in {1..4}; do
            bspc desktop "$DESKTOP" -m "$(xrandr -q | grep -E '\bconnected [[:digit:]]{1,4}x' | grep +"$(echo "$sorted" | sed -n '1p')"+ | awk '{print $1}')"
        done
        for DESKTOP in {5..8}; do
            bspc desktop "$DESKTOP" -m "$(xrandr -q | grep -E '\bconnected [[:digit:]]{1,4}x' | grep +"$(echo "$sorted" | sed -n '2p')"+ | awk '{print $1}')"
        done
        for DESKTOP in {9..12}; do
            bspc desktop "$DESKTOP" -m "$(xrandr -q | grep -E '\bconnected [[:digit:]]{1,4}x' | grep +"$(echo "$sorted" | sed -n '3p')"+ | awk '{print $1}')"
        done
    elif [ "$num" -eq "2" ]; then
        for DESKTOP in {1..6}; do
            bspc desktop "$DESKTOP" -m "$(xrandr -q | grep -E '\bconnected [[:digit:]]{1,4}x' | grep +"$(echo "$sorted" | sed -n '1p')"+ | awk '{print $1}')"
        done
        for DESKTOP in {7..12}; do
            bspc desktop "$DESKTOP" -m "$(xrandr -q | grep -E '\bconnected [[:digit:]]{1,4}x' | grep +"$(echo "$sorted" | sed -n '2p')"+ | awk '{print $1}')"
        done
    else
        for DESKTOP in {1..12}; do
            bspc desktop "$DESKTOP" -m "$(xrandr -q | grep -E '\bconnected [[:digit:]]{1,4}x' | grep +"$(echo "$sorted" | sed -n '1p')"+ | awk '{print $1}')"
        done
    fi
    for MONITOR in $(xrandr --query | grep disconnected | sed 's/ .*//'); do
        bspc monitor "$MONITOR" -r
    done
    for MONITOR in $inactive; do
        bspc monitor "$MONITOR" -r
    done
    for DESKTOP in $(bspc query -D --names | grep Desktop); do
        bspc desktop Desktop -r
    done
    for MONITOR in $(xrandr --query | grep -E '\bconnected [[:digit:]]{1,4}x' | sed 's/ .*//'); do
        bspc query -m "$MONITOR" -T | jq -r .desktops[].name | sort -n | xargs bspc monitor "$MONITOR" -o
    done
    ~/.config/bspwm/lockscreen &
    ~/.config/polybar/run.sh &
    sleep 2s
    echo "" >~/.config/bspwm/lock
fi
