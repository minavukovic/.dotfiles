#!/bin/bash

pidof dunst && killall dunst
dunst &

notify-send "test message, hello"
notify-send "this is another message"
notify-send "TEST"
