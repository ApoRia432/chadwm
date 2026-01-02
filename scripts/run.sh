#!/bin/sh

pipewire &
fcitx5 -d &
dunst -config ~/.config/dunst/dunst.ini &
xrdb merge ~/.Xresources 
xbacklight -set 10 &
feh --bg-fill ~/.config/swaybg/aemeath.jpg &
xset r rate 200 30 &
picom --backend glx &

dash ~/.config/chadwm/scripts/bar.sh &
while type chadwm >/dev/null; do chadwm && continue || break; done
