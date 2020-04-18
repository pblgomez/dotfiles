#!/bin/sh

# Exports
export TERMINAL="alacritty"

# wallpaper
cp $(find $(pwd)/Pictures/Wallpapers -type f | sort -R |head -n1) ~/.cache/bg && convert ~/.cache/bg ~/.cache/bg.png && xwallpaper --zoom ~/.cache/bg &
# keyboard layout
setxkbmap us,es -option grp:rctrl_rshift_toggle
# apps at startup
unclutter &
# xmodmap ~/.config/Xmodmap
sxhkd &
# desktop
exec i3
