#!/bin/sh


[ -z "$(lsmod | grep 'uvcvideo')" ] && \
    webcam=1

if [ "$1" = 'toggle' ]; then
    if [ -z "$(lsmod | grep 'uvcvideo')" ]; then
        sudo modprobe uvcvideo
    else
        sudo modprobe -r uvcvideo
    fi
fi

if pactl get-source-mute @DEFAULT_SOURCE@ 2>/dev/null | grep 'yes' 2>&1 >/dev/null; then
    echo '󰍭'
else
    echo '󰍬'
fi

exit 0
