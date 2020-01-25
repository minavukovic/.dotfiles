#!/bin/bash

# convert md to pdf
from="$1"
pandoc $from -s -o ${from%%.*}.pdf
echo "Converted to pdf ${from%%.*}.pdf!"
zathura ${from%%.*}.pdf

