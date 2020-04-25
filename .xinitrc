#!/bin/sh



#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto
#exec /usr/bin/prime-offload


# wallpaper
if [ -f ~/.cache/bg ]; then
  xwallpaper --zoom ~/.cache/bg &
else
  cp $(find $(pwd)/Pictures/Wallpapers -type f | sort -R |head -n1) ~/.cache/bg && convert -resize 1920 -blur 30x30 ~/.cache/bg ~/.cache/bg.png && xwallpaper --zoom ~/.cache/bg &
fi

# keyboard layout
setxkbmap us,es alt-intl-unicode, -option grp:rctrl_rshift_toggle

# apps at startup
dunst &
udiskie &
unclutter &
~/.local/bin/touchpad-enable.sh &
picom &
redshift &
autorandr -c &
# optimus-manager-qt

# xmodmap ~/.config/Xmodmap
sxhkd &
# desktop
exec i3
