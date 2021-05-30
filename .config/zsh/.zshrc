# ENVS
#source ~/.gnupg/triller/triller.envs

# for compatibility reasons
export TERM=xterm-256color

#XDG Base Directories
export XDG_DATA_HOME="$HOME/.local/share"
export CARGO_HOME="$XDG_DATA_HOME"/cargo        # Rust / Cargo
export VAGRANT_HOME="XDG_CONFIG_HOME/.vagrant.d"
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export GOPATH="$XDG_DATA_HOME"/go               # Go

# PATH
## for AppImages
export PATH=$PATH:~/Applications:/opt/appimages
## Ruby
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
## scripts
export PATH=$PATH:~/Applications:/opt/appimages
export PATH=$PATH:~/.scripts:~/.local/bin


# Filetypes
# $ xdg-mime query filetype photo.jpeg
# $ xdg-mime query default image/jpeg
# $ xdg-mime default feh.desktop image/jpeg
xdg-mime default vscodium.desktop text/plain

# For cache dir
ZSH_CACHE_DIR="$HOME/.cache/zsh"

## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
unsetopt nomatch						# Passes the command as is instead of reporting pattern matching failure see Chrysostomus/manjaro-zsh-config#14
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.

# Autocomplete ../
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE="$ZDOTDIR"/zhistory
HISTSIZE=1000
SAVEHIST=500
setopt HIST_IGNORE_SPACE
export EDITOR=/usr/bin/nvim
#export VISUAL=/usr/bin/nano
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word


## Keybindings section
#bindkey -v
set -o vi

## Alias section 
source "$ZDOTDIR"/zsh_aliases

# Theming section  
autoload -U compinit colors zcalc
compinit -d
colors

# enable substitution for prompt
setopt prompt_subst

# Prompt (on left side) similar to default bash prompt, or redhat zsh prompt with colors
 #PROMPT="%(!.%{$fg[red]%}[%n@%m %1~]%{$reset_color%}# .%{$fg[green]%}[%n@%m %1~]%{$reset_color%}$ "
# Maia prompt
#PROMPT="%B%{$fg[cyan]%}%(4~|%-1~/.../%2~|%~)%u%b >%{$fg[cyan]%}>%B%(?.%{$fg[cyan]%}.%{$fg[red]%})>%{$reset_color%}%b " # Print some system information when the shell is first started
# Print a greeting message when shell is started
echo $USER@$HOST  $(uname -srm) 
## Prompt on right side:
#  - shows status of git when in git repository (code adapted from https://techanic.net/2012/12/30/my_git_prompt_for_zsh.html)
#  - shows exit status of previous command (if previous command finished with an error)
#  - is invisible, if neither is the case

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r


## Plugins section: Enable fish style features
# Use syntax highlighting
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Use history substring search
[ -f /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ] && source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Use Autosuggestion
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'

# bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up			
    autoload -U up-line-or-beginning-search
    zle -N up-line-or-beginning-search
    bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
    autoload -U down-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi


# Start graphical server on tty1 if not already running.
# For Sway
#command -v sway >/dev/null && [ "$(tty)" = "/dev/tty1" ] && [ -z $DISPLAY ] && exec sway 
# Fox X
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx $XINITRC
#[ "$(tty)" = "/dev/tty2" ] && ! pgrep -x Xorg >/dev/null && exec nvidia-xrun i3
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx

# zsh pure theme
fpath+="$ZDOTDIR"/pure
autoload -U promptinit; promptinit
prompt pure

# kubie prompt ( depends on kube-ps1 package )
source /opt/kube-ps1/kube-ps1.sh
PROMPT='$(kube_ps1)'$PROMPT


# AWS prompt
#source '"$ZDOTDIR"/shell-aws-autoprofile/shell-aws-autoprofile.sh'
function aws_prompt_info() {
  [[ -z $AWS_PROFILE ]] && return
  echo "${ZSH_THEME_AWS_PREFIX:=<AWS:}${AWS_PROFILE}${ZSH_THEME_AWS_SUFFIX:=>}"
}

if [[ "$SHOW_AWS_PROMPT" != false && "$PROMPT" != *'$(aws_prompt_info)'* ]]; then
  PROMPT='$(aws_prompt_info)'"$PROMPT"
fi
