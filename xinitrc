#!/bin/sh
# Disable processor sounds
xset -b

# asdf
setxkbmap -option 'caps:ctrl_modifier' && xcape -e 'Caps_Lock=Escape' &

# Set toggle between bulgarian phonetic and us.
setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,bg -variant ,phonetic &

xrandr --dpi 125
exec i3
./mouse.sh
