#!/bin/sh

if [ "$(systemctl is-active "bluetooth.service")" = "active" ]; then
    devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
    echo "$devices_paired" | while read -r line; do
        device_info=$(bluetoothctl info "$line")
        if echo "$device_info" | grep -q "Connected: yes"; then
            device_alias=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)
            printf " %s" "$device_alias"
        else
            printf "\n"
        fi
    done
fi

