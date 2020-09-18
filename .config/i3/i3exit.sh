#!/bin/bash
lock() {
    i3lock --color "151c28"
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        # lock && systemctl suspend
        systemctl suspend
        ;;
    hibernate)
        # lock && systemctl hibernate
        systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
