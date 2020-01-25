#!/bin/bash
INCREASE=$1
DECREASE=$2

if [[ $INCREASE == 1 ]]; then
	amixer -D pulse sset Master 5%+
else
	amixer -D pulse sset Master 5%-
fi

