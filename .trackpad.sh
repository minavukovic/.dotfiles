#!/bin/bash
#xinput --set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" -0.5
#xinput --set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" -0.75
xinput --set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" -0.60
#xinput --set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" 1

# send notification
notify-send "Trackpoint speed updated!"
