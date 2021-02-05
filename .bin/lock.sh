#!/bin/sh
xautolock -time 1 -locker "xset dpms force off" -detectsleep & p1=$!
xset dpms 15 30 60
i3lock-fancy -n -p
xset dpms 600 1200 1800
kill "$p1"
