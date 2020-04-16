# Default programs:
export EDITOR="nvim"
# export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"

# ~/ Clean-up:
#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
# export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"
# export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
# export LESSHISTFILE="-"
# export WGETRC="$HOME/.config/wget/wgetrc"
# export INPUTRC="$HOME/.config/inputrc"

# Para que aparezcan los acentos
export LC_CTYPE="en_US.UTF-8"
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
