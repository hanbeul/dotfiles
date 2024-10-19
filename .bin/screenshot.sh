#!/bin/sh
#DISPLAY=:0 scrot -s
#DISPLAY=:0 scrot -s -e 'xclip -selection clipboard -t image/png -i $f'
DISPLAY=:0 scrot -s - | xclip -selection clipboard -t image/png -i
