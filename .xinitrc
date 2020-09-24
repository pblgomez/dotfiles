#!/bin/sh

# Custom keyboard map
#  xkbcomp $DISPLAY output.xkb  # To get current configuration
#  now follow: https://wiki.archlinux.org/index.php/X_keyboard_extension#Caps_hjkl_as_vimlike_arrow_keys
if [ -f $HOME/.config/pbl.xkb ]; then
  xkbcomp $HOME/.config/pbl.xkb $DISPLAY
else
  setxkbmap us,es altgr-intl, -option grp:rctrl_rshift_toggle
fi

# For nVidia
# /usr/bin/prime-offload &

## common between WM's and DE's
[ -f ~/.xprofile ] && . ~/.xprofile
[ -f ~/.xsessionrc ] && . ~/.xsessionrc

## desktop i3
# sxhkd &
# $HOME/.config/polybar/launch.sh
# picom &
# exec i3

# desktop bspwm
sxhkd -c $HOME/.config/sxhkd/bspwm $XDG_CONFIG_HOME/sxhkd/sxhkdrc &
$HOME/.config/polybar/launch.sh
picom &
exec bspwm
