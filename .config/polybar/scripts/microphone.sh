#!/bin/sh

if [ "$1" = 'toggle' ]; then
    pactl set-source-mute @DEFAULT_SOURCE@ toggle
fi

if pactl get-source-mute @DEFAULT_SOURCE@ 2>/dev/null | grep 'yes' 2>&1 >/dev/null; then
    echo '󰍭'
else
    echo '󰍬'
fi

exit 0
