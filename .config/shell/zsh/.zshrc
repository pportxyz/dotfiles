# Path to your oh-my-zsh installation.
export ZSH="$ZDOTDIR/oh-my-zsh"

ZSH_THEME="zhann"
#ZSH_THEME="kennethreitz"
#ZSH_THEME="half-life"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    aws
    colored-man-pages
    #themes
)

source $ZSH/oh-my-zsh.sh

#
# User configuration
#

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Aliases
source $XDG_CONFIG_HOME/shell/aliases

# NVM
export NVM_DIR="$HOME/.local/share/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Vim mode
bindkey -v
export KEYTIMEOUT=1

# Autocompletion
autoload -Uz compinit; compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

source /opt/google-cloud-sdk/path.zsh.inc
source /opt/google-cloud-sdk/completion.zsh.inc

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
