#!/bin/bash

echo ""
echo "Choose Polybar accent color:"
echo -e "\x1b[48;2;20;21;26m                                          \x1b[0m"
echo -e "\x1b[48;2;20;21;26m   1      2      3      4      5      6   \e[m"
echo -e "\e[48;5;1m       \e[48;5;2m       \e[48;5;3m       \e[48;5;4m       \e[48;5;5m       \e[48;5;6m       \e[m"
echo -e "\x1b[48;2;20;21;26m                                          \x1b[0m"
echo -e "\x1b[48;2;20;21;26m   7      8      9     10     11     12   \e[m"
echo -e "\e[48;5;9m       \e[48;5;10m       \e[48;5;11m       \e[48;5;12m       \e[48;5;13m       \e[48;5;14m       \e[m"
echo -e "\x1b[48;2;20;21;26m                                          \x1b[0m"
echo -e "\x1b[48;2;20;21;26m  13     14     15     16     17     18   \e[m"
echo -e "\x1b[48;2;140;12;0m       \x1b[48;2;137;175;109m       \x1b[48;2;206;148;31m       \x1b[48;2;59;76;111m       \x1b[48;2;178;108;199m       \x1b[48;2;77;164;175m       \x1b[0m"
echo ""
color=""
while [[ $color == "" ]]; do
    read -r choice
    case $choice in
    "1")
        color=e53947
        ;;
    "2")
        color=74e000
        ;;
    "3")
        color=e5c33e
        ;;
    "4")
        color=4a7de5
        ;;
    "5")
        color=ce3be5
        ;;
    "6")
        color=16bcce
        ;;
    "7")
        color=af3a32
        ;;
    "8")
        color=64c20c
        ;;
    "9")
        color=e5d083
        ;;
    "10")
        color=579dd7
        ;;
    "11")
        color=cc67b9
        ;;
    "12")
        color=5fd3de
        ;;
    "13")
        color=7e0b00
        ;;
    "14")
        color=7b9d62
        ;;
    "15")
        color=b9851c
        ;;
    "16")
        color=354464
        ;;
    "17")
        color=a061b3
        ;;
    "18")
        color=45949d
        ;;
    *) ;;

    esac
done
sed -i "s/^ac\s.*/ac = #${color}/g" "${HOME}"/.config/polybar/colors.ini
sed -i "s/^drawColor=.*/drawColor=#${color}/g" "${HOME}"/.config/flameshot/flameshot.ini
sed -i "s/^uiColor=.*/uiColor=#${color}/g" "${HOME}"/.config/flameshot/flameshot.ini
sed -i "s/^\s*frame_color = .*/    frame_color = \"#${color}\"/g" "${HOME}"/.config/dunst/dunstrc
