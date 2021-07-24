#
# .zprofile
#
# pport's dotfiles
#

# default programs
export TERMINAL="kitty"
export EDITOR="nvim"
export BROWSER="qutebrowser"
export BROWSER_ALT="brave"
export FMANAGER="ranger"
export READER="zathura"

# default XDG dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# add local scripts to path
export PATH="$PATH:$HOME/.local/bin"

# bw session
export BW_SESSION="OcIfpxxkycB7c7DNg/VMac7PT8lLMGTxiheZ/CqYc2AJe4f8/8kw47U/l97vICwssik2zQFkJCfIzq03YqToRg=="

# fzf default command
export FZF_DEFAULT_COMMAND="fd --hidden"

# clean home
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export LESSHISTFILE=-
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XAUTHORITY="$XDG_CONFIG_HOME/X11/xauthority"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export PYLINTHOME="$XDG_CACHE_HOME"/pylint

# autostart X at login (Xinit Arch Wiki Page)
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    # Quiet startx (Silent Boot Arch Wiki Page)
    exec startx "$XINITRC" &> /dev/null
fi

