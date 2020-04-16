#!/bin/bash

# find second instance of polybar
output=$(pidof polybar)

# extract pid
p="${output#* }"

# kill
kill -9 $p
