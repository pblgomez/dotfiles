#!/bin/sh

# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto

#QT appeareance, you have to install qt5ct and kvantum
export QT_QPA_PLATFORMTHEME="qt5ct"

# Default programs:
export TERMINAL="kitty"
export EDITOR="nvim"

# apps at startup
autorandr-launcher &
dunst &
kdeconnect-indicator &
udiskie &
unclutter &
~/.local/bin/touchpad-enable.sh &
picom --experimental-backends --backend glx --blur-method dual_kawase --blur-strength 5 &
redshift &
autorandr -c &
xrdb ~/.Xresources
/usr/lib/kdeconnectd &
# optimus-manager-qt

# wallpaper
if [ -f ~/.cache/bg ]; then
  sleep 4; xwallpaper --zoom ~/.cache/bg &
else
  cp $(find $(pwd)/Pictures/Wallpapers -type f | sort -R |head -n1) ~/.cache/bg && convert -resize 1920 -blur 30x30 ~/.cache/bg ~/.cache/bg.png && xwallpaper --zoom ~/.cache/bg &
fi

# xmodmap ~/.config/Xmodmap
sxhkd &

# Custom keyboard map
if [ -f $HOME/.config/pbl.xkb ]; then
  # https://wiki.archlinux.org/index.php/X_keyboard_extension#Caps_hjkl_as_vimlike_arrow_keys
  xkbcomp $HOME/.config/pbl.xkb $DISPLAY
else
  setxkbmap us,es altgr-intl, -option grp:rctrl_rshift_toggle
fi

# For nVidia
# /usr/bin/prime-offload &

# desktop
exec i3
