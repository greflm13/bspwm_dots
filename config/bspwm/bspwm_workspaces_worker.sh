autorandr -c
if [ "$(<~/.config/bspwm/lock)" != "lock" ]; then
    echo "lock" > ~/.config/bspwm/lock
    if [ "$(xrandr --query | grep '\bconnected' | wc -l)" -eq "4" ]; then
        for MONITOR in $(bspc query -M); do
            bspc monitor $MONITOR -a Desktop
        done
        for DESKTOP in 1 2 3; do
            bspc desktop $DESKTOP -m $(xrandr --query | grep '\bconnected' | sed -n 1p | sed 's/ .*//')
        done
        for DESKTOP in 4 5 6; do
            bspc desktop $DESKTOP -m $(xrandr --query | grep '\bconnected' | sed -n 2p | sed 's/ .*//')
        done
        for DESKTOP in 7 8 9; do
            bspc desktop $DESKTOP -m $(xrandr --query | grep '\bconnected' | sed -n 3p | sed 's/ .*//')
        done
        for DESKTOP in 10 11 12; do
            bspc desktop $DESKTOP -m $(xrandr --query | grep '\bconnected' | sed -n 4p | sed 's/ .*//')
        done
        for MONITOR in $(xrandr --query | grep disconnected | sed 's/ .*//'); do
            bspc monitor $MONITOR -r
        done
        for DESKTOP in $(bspc query -D --names | grep Desktop); do
            bspc desktop Desktop -r
        done
        for MONITOR in $(bspc query -M); do
            bspc query -m $MONITOR -T | jshon -e desktops -a -e name -u | sort -n | xargs bspc monitor $MONITOR -o
        done
        
        elif [ "$(xrandr --query | grep '\bconnected' | wc -l)" -eq "3" ]; then
        for MONITOR in $(bspc query -M); do
            bspc monitor $MONITOR -a Desktop
        done
        for DESKTOP in 1 2 3 4; do
            bspc desktop $DESKTOP -m $(xrandr --query | grep '\bconnected' | sed -n 1p | sed 's/ .*//')
        done
        for DESKTOP in 5 6 7 8; do
            bspc desktop $DESKTOP -m $(xrandr --query | grep '\bconnected' | sed -n 2p | sed 's/ .*//')
        done
        for DESKTOP in 9 10 11 12; do
            bspc desktop $DESKTOP -m $(xrandr --query | grep '\bconnected' | sed -n 3p | sed 's/ .*//')
        done
        for MONITOR in $(xrandr --query | grep disconnected | sed 's/ .*//'); do
            bspc monitor $MONITOR -r
        done
        for DESKTOP in $(bspc query -D --names | grep Desktop); do
            bspc desktop Desktop -r
        done
        for MONITOR in $(bspc query -M); do
            bspc query -m $MONITOR -T | jshon -e desktops -a -e name -u | sort -n | xargs bspc monitor $MONITOR -o
        done
        
        elif [ "$(xrandr --query | grep '\bconnected' | wc -l)" -eq "2" ]; then
        for MONITOR in $(bspc query -M); do
            bspc monitor $MONITOR -a Desktop
        done
        for DESKTOP in 1 2 3 4 5 6; do
            bspc desktop $DESKTOP -m $(xrandr --query | grep '\bconnected' | sed -n 1p | sed 's/ .*//')
        done
        for DESKTOP in 7 8 9 10 11 12; do
            bspc desktop $DESKTOP -m $(xrandr --query | grep '\bconnected' | sed -n 2p | sed 's/ .*//')
        done
        for MONITOR in $(xrandr --query | grep disconnected | sed 's/ .*//'); do
            bspc monitor $MONITOR -r
        done
        for DESKTOP in $(bspc query -D --names | grep Desktop); do
            bspc desktop Desktop -r
        done
        for MONITOR in $(bspc query -M); do
            bspc query -m $MONITOR -T | jshon -e desktops -a -e name -u | sort -n | xargs bspc monitor $MONITOR -o
        done
        
    else
        for MONITOR in $(bspc query -M); do
            bspc monitor $MONITOR -a Desktop
        done
        for DESKTOP in 1 2 3 4 5 6 7 8 9 10 11 12; do
            bspc desktop $DESKTOP -m $(xrandr --query | grep '\bconnected' | sed -n 1p | sed 's/ .*//')
        done
        for MONITOR in $(xrandr --query | grep disconnected | sed 's/ .*//'); do
            bspc monitor $MONITOR -r
        done
        for DESKTOP in $(bspc query -D --names | grep Desktop); do
            bspc desktop Desktop -r
        done
        for MONITOR in $(bspc query -M); do
            bspc query -m $MONITOR -T | jshon -e desktops -a -e name -u | sort -n | xargs bspc monitor $MONITOR -o
        done
    fi
    ~/.config/bspwm/lockscreen &
    ~/.config/polybar/run.sh &
    sleep 2s
    echo "" > ~/.config/bspwm/lock
fi
