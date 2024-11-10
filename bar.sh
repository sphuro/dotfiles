
#!/bin/bash

# BG="#8bc8b9"
# BG="#32a882"
BG="#74d8ab"
FG="#000000"
RESET="^d^"

battery(){
    cmd="$(acpi | cut -d, -f2 | awk '{print $1}' | cut -d% -f1)"
    echo -ne "^b$BG^^c$FG^ BAT $RESET $cmd%"
}

volume(){
    # Check if the system is muted
    is_muted="$(pactl get-sink-mute @DEFAULT_SINK@ | cut -d: -f2 | awk '{print $1}')"
    
    if [ "$is_muted" == "yes" ]; then
        # If muted, call mute function instead of showing volume level
        mute
    else
        # If not muted, show volume level
        cmd="$(pactl get-sink-volume 0 | cut -d/ -f2 | sed -n 1p | awk '{print $1}' | cut -d% -f1)"
        echo -ne "^b$BG^^c$FG^ Vol $RESET $cmd%"
    fi
}

brightness(){
    cmd="$(sudo ybacklight -get | cut -d. -f1)"
    echo -ne "^b$BG^^c$FG^ Bright $RESET $cmd%"
}

mute(){
    echo -ne "^b$BG^^c$FG^ Vol $RESET Muted"
}

bluetooth(){
    cmd="$(bluetoothctl devices Connected | sed -n 1p)"
    if [ "$cmd" != "" ]; then
        echo -ne "^b$BG^^c$FG^ BLU $RESET $cmd"
    fi
}

wifi(){
    cmd="$(nmcli connection | awk '{print $1}' | sed -n 2p)"
    echo -ne "^b$BG^^c$FG^ WIFI $RESET $cmd"
}

arch(){
    # cmd="󰣇 ARCHLINUX"
    cmd=" SPHURO"
    echo -ne "^c$BG^ $cmd$RESET"
}

_time(){
    cmd="$(date +'%H:%M')"
    echo -ne "^b$BG^^c$FG^ Clk $RESET $cmd"
}

_date(){
    cmd="$(date +'%b %d, %a')"
    echo -ne "^b$BG^^c$FG^ Date $RESET $cmd"
}

_mem(){
    mem_used="$(top -b -n 1 | grep -i mem | sed -n 1p | awk '{print $8}')"
    mem_total="$(top -b -n 1 | grep -i mem | sed -n 1p | awk '{print $4}')"
    mem_perc_with_extra="$(echo "scale = 4; ($mem_used/$mem_total)*100" | bc)"
    final_mem_perc="${mem_perc_with_extra::-2}%"
    echo -ne "^b$BG^^c$FG^ RAM $RESET $final_mem_perc"
}

_cpu(){
    foo="$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}')"
    cmd=${foo::-2}
    cmd="$(echo $cmd | cut -c 1-4)%"
    echo -ne "^b$BG^^c$FG^ CPU $RESET $cmd"
}

while true; do
    xsetroot -name "$(arch) $(_cpu) $(_mem) $(volume) $(battery) $(_time) $(_date)"
    sleep 1
done
