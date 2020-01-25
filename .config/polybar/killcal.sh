#!/bin/bash
PID=$(pgrep "gsimplecal")
kill $PID
