#!/bin/sh

if [ -f "$HOME/.Xresources" ]; then
    xrdb -merge "$HOME/.Xresources"
fi
xsetroot -cursor_name left_ptr &
xbindkeys --poll-rc &
setxkbmap es &
xbacklight -set 20 &
xinput set-prop "SYNA2393:00 06CB:7A13 Touchpad" "libinput Tapping Enabled" 1 &
xinput set-prop "SYNA2393:00 06CB:7A13 Touchpad" "libinput Natural Scrolling Enabled" 1	&
exec bspwm
