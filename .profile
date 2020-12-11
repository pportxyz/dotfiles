#
# ~/.profile
#
# pport's dotfiles
#

# default programs
export TERMINAL="kitty"
export EDITOR="nvim"
export BROWSER="chromium"
export FMANAGER="ranger"
export READER="zathura"

# default XDG dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# add local scripts to path
export PATH=$PATH:$HOME/.local/bin

# clean home
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export LESSHISTFILE=-
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XAUTHORITY="$XDG_CONFIG_HOME/X11/xauthority"

# source .bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# autostart X at login (Xinit Arch Wiki Page)
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    # Quiet startx (Silent Boot Arch Wiki Page)
    exec startx "$XINITRC" &> /dev/null
fi
