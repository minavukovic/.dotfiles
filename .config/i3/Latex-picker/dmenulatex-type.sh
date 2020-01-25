#!/bin/sh
# Auto type latex maths symbols
# Inspired by Luke Smith's dmenuunicode tool
# Requires dmenu, xdotool (xorg X11)

chosen=$(grep -v "#" ~/.config/i3/Latex-picker/latexsymbols | dmenu -i -l 10 -fn Hack-14 -nb '#000000' -nf '#f46b42' -sb '#353532' -sf '#edd7d0')

[ "$chosen" != "" ] || exit

c=$(echo "$chosen" | cut -d";" -f2)
echo "$c" | tr -d '\n' | xdotool type --file -
