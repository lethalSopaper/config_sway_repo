#!/bin/bash

DEVICE_MAC="74:B5:DA:7F:79:8D"
DEVICE_NAME="PYLEUSA"

# Check if the device is connected
is_connected=$(bluetoothctl info "$DEVICE_MAC" | grep -q "Connected: yes" && echo "yes" || echo "no")

if [ "$is_connected" == "yes" ]; then
    notify-send -u normal "Bluetoothctl disconnect" "Disconnecting from $DEVICE_NAME..."
    bluetoothctl disconnect "$DEVICE_MAC"
    if [ $? -eq 0 ]; then
        notify-send -u low "Bluetoothctl disconnect" "Successfully disconnected from $DEVICE_NAME."
    else
        notify-send -u critical "Bluetoothctl disconnect" "Failed to disconnect from $DEVICE_NAME."
    fi
else
    notify-send -u normal "Bluetoothctl connect" "Connecting to $DEVICE_NAME..."
    bluetoothctl connect "$DEVICE_MAC"
    if [ $? -eq 0 ]; then
        notify-send -u low "Bluetoothctl connect" "Successfully connected to $DEVICE_NAME."
    else
        notify-send -u critical "Bluetoothctl connect" "Failed to connect to $DEVICE_NAME."
    fi
fi
