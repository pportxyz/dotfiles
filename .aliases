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
alias dotd='dot diff'
alias dotp='dot push'
alias paclist='pacman -Qqe'     # -t: not dependencies / -m: aur packages
alias pacorphans='sudo pacman -Rns $(pacman -Qtdq)'
alias msc='mpd && ncmpcpp'
alias feh='feh -d --scale-down'
alias emptytrash='rm -rf .trash/*'

alias laniakeaon="wol -f $HOME/.laniakea_mac_address"
function laniakeaoff () {
    if ping -c 1 laniakea.ink 2>&1 1>/dev/null; then
        ssh laniakea -t sudo poweroff
    else
        echo "[error] Laniakea server is not running."
    fi
}

