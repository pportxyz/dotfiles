#!/bin/sh

if [ "$1" = 'toggle' ]; then
    if [ "$( systemctl is-active 'bluetooth.service' )" = 'active' ]; then
        systemctl stop 'bluetooth.service'
        echo '󰂲'
    else
        systemctl start 'bluetooth.service'
        echo '󰂯'
    fi
    exit 0
fi


if [ "$(systemctl is-active 'bluetooth.service')" = 'active' ]; then
    devices_paired=$( bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2 )
    for device in $devices_paired; do
        device_info=$(bluetoothctl info "$device")
        if echo "$device_info" | grep -q 'Connected: yes'; then
            device_alias=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)
            echo "󰂱 $device_alias"
        else
            echo '󰂯'
        fi
    done
else
    echo '󰂲'
fi

exit 0
