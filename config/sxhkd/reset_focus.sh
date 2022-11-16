#!/bin/bash
num="$(xrandr --query | grep -c '\bconnected')"
if [ "$num" -eq "4" ]; then
    bspc desktop -f 10
    bspc desktop -f 7
    bspc desktop -f 4
    bspc desktop -f 1
elif [ "$num" -eq "3" ]; then
    bspc desktop -f 9
    bspc desktop -f 5
    bspc desktop -f 1
elif [ "$num" -eq "2" ]; then
    bspc desktop -f 7
    bspc desktop -f 1
else
    bspc desktop -f 1
fi
