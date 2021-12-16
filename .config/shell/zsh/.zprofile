# vim: filetype=sh:
#
# .zprofile
#
# pport's dotfiles
#

source $HOME/.config/shell/profile

# autostart X at login (Xinit Arch Wiki Page)
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    # Quiet startx (Silent Boot Arch Wiki Page)
    exec startx "$XINITRC" &> /dev/null
fi

