#!/bin/bash

volume() {
    VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | head -n1 | sed -s "s/%//g")

    echo "${VOLUME}%"
}

ismute() {
    IS_MUTED=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}' | head -n1)

    if [ "${IS_MUTED}" != "no" ]; then
        echo "Muted!"
    else
        echo "Unmuted!"
    fi
}

case "$1" in
--volume)
    volume
    ;;
--mute)
    ismute
    ;;
*)
    volume
    ;;
esac
