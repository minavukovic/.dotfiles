#!/bin/bash

STATUS=$(acpi)


notify-send -t 2000 "${STATUS}"
