#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lhA'
alias cat='bat'
alias e='vim'
alias se='sudoedit'
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
#alias tlmgr="$TEXMFDIST/scripts/texlive/tlmgr.pl --usermode"

PS1='[\u@\h \W]\$ '

export SUDO_EDITOR='vim'
#export TEXMFDIST='/usr/share/texmf-dist'

# Source bash aliases
if [ -f "~/.bash_aliases" ]; then
	. ~/.bash_aliases
fi

