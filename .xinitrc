#!/bin/sh

## common between WM's and DE's
[ -f ~/.xprofile ] && . ~/.xprofile
[ -f ~/.xsessionrc ] && . ~/.xsessionrc

## desktop i3
# sxhkd &
# $HOME/.config/polybar/launch.sh
# exec i3

# desktop bspwm
#sxhkd -c $HOME/.config/sxhkd/bspwm $XDG_CONFIG_HOME/sxhkd/sxhkdrc &
#$HOME/.config/polybar/launch.sh &
#picom -b --experimental-backends --backend glx --blur-method dual_kawase --blur-strength 10 &
exec bspwm
