#!/bin/sh

# apps at startup
unclutter &

# wallpaper
cp $(find $(pwd)/Pictures/Wallpapers -type f | sort -R |head -n1) ~/.cache/bg && convert ~/.cache/bg ~/.cache/bg.png && xwallpaper --zoom ~/.cache/bg &

# desktop
exec i3
