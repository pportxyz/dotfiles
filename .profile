#
# ~/.profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Autostart X at login (Xinit Arch Wiki Page)
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    # Quiet startx (Silent Boot Arch Wiki Page)
    exec startx &> /dev/null
fi
