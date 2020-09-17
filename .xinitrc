#!/bin/sh

# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto

#QT appeareance, you have to install qt5ct and kvantum
export QT_QPA_PLATFORMTHEME="qt5ct"

# Default programs:
export TERMINAL="alacritty"
export EDITOR="nvim"

# apps at startup
autorandr-launcher &
dunst &
kdeconnect-indicator &
udiskie &
unclutter &
~/.local/bin/touchpad-enable.sh &
picom &
redshift &
autorandr -c &
xrdb ~/.Xresources
/usr/lib/kdeconnectd &
# optimus-manager-qt

# xmodmap ~/.config/Xmodmap

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

# wallpaper
if [ -f ~/.cache/bg ]; then
  sleep 4; xwallpaper --zoom ~/.cache/bg &
else
  cp $(find $(pwd)/Pictures/Wallpaper -type f | sort -R |head -n1) ~/.cache/bg && convert -resize 1920 -blur 30x30 ~/.cache/bg ~/.cache/bg.png && xwallpaper --zoom ~/.cache/bg &
fi

# desktop i3
# sxhkd &
# exec i3

# desktop bspwm
sxhkd -c $HOME/.config/sxhkd/bspwm $XDG_CONFIG_HOME/sxhkd/sxhkdrc &
$HOME/.config/polybar/launch.sh
exec bspwm
