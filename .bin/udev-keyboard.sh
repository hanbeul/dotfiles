#!/bin/sh
DISPLAY=:0
XAUTHORITY=/home/hanbeul/.Xauthority

DISPLAY=:0 XAUTHORITY=/home/hanbeul/.Xauthority setxkbmap -option caps:none
DISPLAY=:0 XAUTHORITY=/home/hanbeul/.Xauthority /usr/bin/xset r rate 200 25
DISPLAY=:0 XAUTHORITY=/home/hanbeul/.Xauthority /usr/bin/xinput --set-prop "Logitech Gaming Mouse G502" "libinput Accel Profile Enabled" 0, 1
DISPLAY=:0 XAUTHORITY=/home/hanbeul/.Xauthority /usr/bin/xinput --set-prop "Logitech USB Receiver" "libinput Accel Profile Enabled" 0, 1
