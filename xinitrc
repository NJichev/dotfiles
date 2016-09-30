setxkbmap -option 'caps:ctrl_modifier' && xcape -e 'Caps_Lock=Escape' &
source ~/.fehbg

# Set toggle between bulgarian phonetic and us.
setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,bg -variant ,phonetic &

# Disable processor sounds
xset -b

# Lemonbar
# ~/Downloads/czaugk.sh | lemonbar -p -F "#FFB5B2AF" -B "#FF282522" -g "1366x20+0+0" -f "Droid Sans-10" -f "FontAwesome-10" &
