#!/bin/bash

MENU="$(echo "" | dmenu -p "Brightness" -nb '#08090c' -nf '#f6f6f6' -sb '#08090c' -sf '#f6f6f6')"
brightnessctl s "$MENU"%
