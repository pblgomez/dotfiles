#!/bin/sh

# Exports
export TERMINAL="alacritty"

# wallpaper
if [ -f ~/.cache/bg ]; then
  xwallpaper --zoom ~/.cache/bg &
else
  cp $(find $(pwd)/Pictures/Wallpapers -type f | sort -R |head -n1) ~/.cache/bg && convert -resize 1920 ~/.cache/bg ~/.cache/bg.png && xwallpaper --zoom ~/.cache/bg &
fi

# keyboard layout
setxkbmap us,es -option grp:rctrl_rshift_toggle


# apps at startup
dunst &
udiskie &
unclutter &
~/.local/bin/touchpad-enable.sh &
picom &
redshift &

# xmodmap ~/.config/Xmodmap
sxhkd &
# desktop
exec i3
# For nvidia only 
# exec /usr/bin/prime-offload
