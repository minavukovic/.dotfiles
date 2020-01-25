#!/bin/bash

fecha=$(date '+%a, %d | %H:%M')
case $BLOCK_BUTTON in
  1) exec gsimplecal;;  # right click, mute/unmute
#  4) amixer -q -D $MIXER sset $SCONTROL $(capability) ${STEP}+ unmute ;; # scroll up, increase
#  5) amixer -q -D $MIXER sset $SCONTROL $(capability) ${STEP}- unmute ;; # scroll down, decrease
esac
echo  $fecha
