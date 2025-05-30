#!/bin/bash

echo -e "Below is a list of already paired Bluetooth devices / MAC addresses:\n"
bluetoothctl devices
echo

# Variable with known MAC address
BTD="Enter your MAC here"

# Check if the BTD device is already connected
connection_status=$(bluetoothctl info "$BTD" | grep "Connected: yes")

if [ -n "$connection_status" ]; then
    echo -e "\nDevice $BTD is already connected. Exiting script."
    exit 0
fi

# If not connected, check if it's a known device
if bluetoothctl devices | grep -q "$BTD"; then
    echo -e "\nKnown device $BTD found. Attempting to connect..."
    bluetoothctl connect "$BTD" > /dev/null 2>&1

    sleep 2

    # Recheck connection
    if bluetoothctl info "$BTD" | grep -q "Connected: yes"; then
        echo "Successfully connected to $BTD"
        exit 0
    else
        echo "Failed to connect to $BTD. Please choose another device."
    fi
fi

# Prompt user to enter another MAC address
echo -e "\nPlease enter the MAC address of the paired device you wish to connect:"
read mac

echo -e "\nConnecting to $mac..."
bluetoothctl connect "$mac"
