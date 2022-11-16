#!/bin/bash
bspc subscribe monitor | while read -r line; do
    case $line in
    monitor_add* | monitor_geometry*)
        ~/.config/bspwm/bspwm_workspaces_worker.sh &
        ;;
    *) ;;

    esac
done
