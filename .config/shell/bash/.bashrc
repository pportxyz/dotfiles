#
# ~/.bashrc     #@# pport
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

export SUDO_EDITOR='vim'

# Source bash aliases
[[ -f ~/.aliases ]] && . ~/.aliases

