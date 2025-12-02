#!/bin/bash

# Path to your keyboard device in upower
DEVICE="/org/freedesktop/UPower/devices/keyboard_dev_F3_95_6C_DE_0A_EB"

# Get the battery percentage
PERCENT=$(upower -i "$DEVICE" | awk '/percentage:/ {print $2}')

# Print it with a keyboard emoji
echo "⌨️ $PERCENT"
