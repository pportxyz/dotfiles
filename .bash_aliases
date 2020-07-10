#
# ~/.bash_aliases   #@# pport
# 

alias ls='exa --icons'
alias ll='ls --long --all'
alias cat='bat'
alias e='vim'
alias se='sudoedit'
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dots='dot status'
alias dota='dot add'
alias dotc='dot commit'
alias dotf='dot diff'
alias paclist='pacman -Qqe'     # -t: not dependencies / -m: aur packages
alias pacorphans='sudo pacman -Rns $(pacman -Qtdq)'
alias wolaniakea="wol -f $HOME/.laniakea_mac_address"
