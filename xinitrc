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

# Automatic lock after 5 minutes
xautolock -time 5 -locker slock &

# systray
trayer --edge top --align right \
    --SetDockType true --SetPartialStrut true --expand true \
    --width 15 --height 25 \
    --transparent true --tint 0x000000 &

# Allow running additional things specific to this machine
if [[ -f "$HOME/.xinitrc.local" ]]; then
    # shellcheck disable=SC1090
    source "$HOME/.xinitrc.local"
fi

exec xmonad
