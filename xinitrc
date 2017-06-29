#!/bin/bash

# see /usr/share/X11/xkb/rules/base.lst for a list of all options
setxkbmap -layout us -variant altgr-intl \
    -option caps:escape \
    -option eurosign:e \
    -option terminate:ctrl_alt_bksp

xrdb -merge ~/.Xresources

eval "$(ssh-agent)"

# Desktop notifications.
dunst &

# tray
trayer --edge bottom --align right --SetDockType true \
    --SetPartialStrut true --expand true --width 10 \
    --transparent true --tint 0x191970 --height 12 &

# Automatic lock after 5 minutes
xautolock -time 5 -locker slock &

# Allow running additional things specific to this machine
if [[ -f "$HOME/.xinitrc.local" ]]; then
    # shellcheck disable=SC1090
    source "$HOME/.xinitrc.local"
fi

exec xmonad
