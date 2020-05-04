#!/bin/sh

#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto
#exec /usr/bin/prime-offload

# keyboard layout
setxkbmap us,es alt-intl-unicode, -option grp:rctrl_rshift_toggle

# apps at startup
autorandr-launcher &
dunst &
udiskie &
unclutter &
~/.local/bin/touchpad-enable.sh &
picom --experimental-backends --backend glx --blur-method dual_kawase --blur-strength 20 &
redshift &
autorandr -c &
# optimus-manager-qt

# wallpaper
if [ -f ~/.cache/bg ]; then
  sleep 5; xwallpaper --zoom ~/.cache/bg &
else
  cp $(find $(pwd)/Pictures/Wallpapers -type f | sort -R |head -n1) ~/.cache/bg && convert -resize 1920 -blur 30x30 ~/.cache/bg ~/.cache/bg.png && xwallpaper --zoom ~/.cache/bg &
fi

# xmodmap ~/.config/Xmodmap
sxhkd &
# Custom keyboard map
if [ -f $HOME/.config/pbl.xkb ]; then
  xkbcomp $HOME/.config/pbl.xkb $DISPLAY
else
  setxkbmap us,es alt-intl-unicode, -option grp:rctrl_rshift_toggle
fi

# desktop
exec i3

