#!/bin/sh
xidlehook --timer 15 "xset dpms force off" "" & p1=$!
/usr/bin/i3lock-fancy-rapid 10 pixel -n
kill "$p1"
