#!/bin/bash
export DISPLAY=:0
export XAUTHORITY="$HOME/.Xauthority"
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

# Set the battery warning threshold
BATTERY_WARNING_LEVEL=15

# Function to get battery percentage
get_battery_percentage() {
  acpi -b | grep -P -o '[0-9]+(?=%)'
}

# Function to check if AC power is connected
is_ac_connected() {
  [[ $(acpi -a | grep -c "on-line") -gt 0 ]]
}

# Function to send notification
send_notification() {
  notify-send -u critical "Low Battery Warning" "Battery level is ${1}%!"
}

# Main loop
while true; do
  battery_level=$(get_battery_percentage)

  if [ "$battery_level" -le "$BATTERY_WARNING_LEVEL" ] && ! is_ac_connected; then
    send_notification "$battery_level"
  fi

  sleep 60 # Check every minute
done
