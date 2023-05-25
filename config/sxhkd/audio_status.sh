#!/bin/bash

volume() {
    VOLUME=$(echo "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}' | head -n1) * 100" | bc | sed -s "s/\.00//g")

    echo "${VOLUME}%"
}

ismute() {
    IS_MUTED=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')

    if [ "${IS_MUTED}" == "[MUTED]" ]; then
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
