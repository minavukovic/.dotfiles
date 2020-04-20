#!/bin/bash

WALLPAPER=$(shuf -n1 -e /home/mina/Pictures/*)
feh --bg-fill ${WALLPAPER}
