bspc subscribe monitor | while read -r line; do
  case $line in
      monitor_add*|monitor_geometry*)
	autorandr -c
        if [ "$(xrandr --qery | grep '\bconnected' | wc -l)" -eq "4" ]; then
          bspc monitor $(xrandr --query | grep '\bconnected' | sed -n 1p | sed 's/ .*//') -d 1 2 3
          bspc monitor $(xrandr --query | grep '\bconnected' | sed -n 2p | sed 's/ .*//') -d 4 5 6
          bspc monitor $(xrandr --query | grep '\bconnected' | sed -n 3p | sed 's/ .*//') -d 7 8 9
          bspc monitor $(xrandr --query | grep '\bconnected' | sed -n 4p | sed 's/ .*//') -d 10 11 12
        elif [ "$(xrandr --query | grep '\bconnected' | wc -l)" -eq "3" ]; then
          bspc monitor $(xrandr --query | grep '\bconnected' | sed -n 1p | sed 's/ .*//') -d 1 2 3
          bspc monitor $(xrandr --query | grep '\bconnected' | sed -n 2p | sed 's/ .*//') -d 4 5 6
          bspc monitor $(xrandr --query | grep '\bconnected' | sed -n 3p | sed 's/ .*//') -d 7 8 9
        elif [ "$(xrandr --query | grep '\bconnected' | wc -l)" -eq "2" ]; then
          bspc monitor $(xrandr --query | grep '\bconnected' | sed -n 1p | sed 's/ .*//') -d 1 2 3 4 5
          bspc monitor $(xrandr --query | grep '\bconnected' | sed -n 2p | sed 's/ .*//') -d 6 7 8 9
        else
          bspc monitor -d 1 2 3 4 5 6 7 8 9
        fi
        ;;
      *)
      ;;
  esac
done 
