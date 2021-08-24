#!/bin/bash

STATUS=$(acpi)


notify-send -h string:bgcolor:#121212 -h string:fgcolor:#ebdbb2 -t 2000 "${STATUS}"
