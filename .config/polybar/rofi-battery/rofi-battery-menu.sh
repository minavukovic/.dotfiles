#!/usr/bin/env bash

BATTERYNUM=$1
BATTERY=$(python /home/mina/.config/polybar/rofi-battery/parseBatteryStatus.py ${BATTERYNUM} 2>&1)
notify-send -h string:bgcolor:#121212 -h string:fgcolor:#ebdbb2 -t 2000 "${BATTERY}"

