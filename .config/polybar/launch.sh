#!/usr/bin/env sh

killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 2; done
if type "xrandr" > /dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar pbl -c ~/.config/polybar/config &
  done
else
  polybar pbl -c ~/.config/polybar/config &
fi

# Wallpaper
feh --bg-fill $HOME/Pictures/Wallpaper/yg5CocJ\ -\ Imgur.jpg
