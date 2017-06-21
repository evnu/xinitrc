#!/bin/bash

# see /usr/share/X11/xkb/rules/base.lst for a list of all options
setxkbmap -layout us -variant altgr-intl \
    -option caps:escape \
    -option eurosign:e \
    -option terminate:ctrl_alt_bksp

xrdb -merge ~/.Xresources

eval $(ssh-agent)

# Desktop notifications.
dunst &

# Allow running additional things specific to this machine
if [[ -f "$HOME/.xinitrc.local" ]]; then
    source $HOME/.xinitrc.local
fi

exec xmonad
