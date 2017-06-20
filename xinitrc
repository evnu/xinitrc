#!/bin/bash

# see /usr/share/X11/xkb/rules/base.lst for a list of all options
setxkbmap -layout us -variant altgr-intl \
    -option caps:escape \
    -option eurosign:e \
    -option terminate:ctrl_alt_bksp

xrdb -merge ~/.Xresources

exec xmonad
