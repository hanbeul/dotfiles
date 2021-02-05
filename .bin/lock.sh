#!/bin/sh
xidlehook --timer 15 "xset dpms force off" "" & p1=$!
i3lock-fancy -n -p
kill "$p1"
