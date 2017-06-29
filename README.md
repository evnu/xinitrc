xinitrc
======

My `.xinitrc` configuration.

## Prerequisites

* ssh-agent
* xmonad
* [dunst](http://knopwob.org/dunst/index.html)
* trayer
* xautolock
* [slock](http://tools.suckless.org/slock/)

## Installation

`ln -s <PATH>/xinitrc <HOME>/.xinitrc`.

## Machine-specific configuration

The configuration file will attempt source `~/.xinitrc.local` for additional configuration specific
to this machine.
