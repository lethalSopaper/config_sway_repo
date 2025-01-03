#!/bin/bash

status=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')

if [ "$status" == "yes" ]; then
    bluetoothctl power off
    echo "Bluetooth turned off"
else
    bluetoothctl power on
    echo "Bluetooth turned on"
fi
