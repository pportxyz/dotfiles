# What's this?

Hi, this is `pport` and this are my dotfiles.

This is my fist attempt to make a stable and long term Arch Linux installation. After doing it
several times, I have learned the hard way to properly document my steps in order to make a favor to
my future self. Therefore, this readme provides a practical guide to quickly reinstall my Arch
setup.

If you have fallen in this repo and you see an error or a recomendation, feel free open an issue or
PM me. Thanks!

# Table of Contents
<!-- This are for github-markdown-toc generator -->
<!--ts-->
   * [What's this?](#whats-this)
   * [Table of Contents](#table-of-contents)
   * [To-Do](#to-do)
   * [Programs](#programs)
   * [Wayland transition](#wayland-transition)
   * [Configs](#configs)
      * [Only for XPS 15 7590 (<a href="https://wiki.archlinux.org/index.php/Dell_XPS_15_7590" rel="nofollow">ArchWiki</a>)](#only-for-xps-15-7590-archwiki)
         * [Default sleep mode](#default-sleep-mode)
      * [Autologin (<a href="https://wiki.archlinux.org/index.php/Getty#Automatic_login_to_virtual_console" rel="nofollow">ArchWiki</a>)](#autologin-archwiki)
      * [Silent Boot (<a href="https://wiki.archlinux.org/index.php/Silent_boot" rel="nofollow">ArchWiki</a>)](#silent-boot-archwiki)
         * [Remove kernel messages](#remove-kernel-messages)
         * [Remove console cursor blinking](#remove-console-cursor-blinking)
         * [Remove last login message](#remove-last-login-message)
         * [Remove fsck messages](#remove-fsck-messages)
         * [Remove getty message (autologin)](#remove-getty-message-autologin)
      * [Locale configuration (<a href="https://wiki.archlinux.org/index.php/Locale" rel="nofollow">ArchWiki</a>)](#locale-configuration-archwiki)
         * [Generating locale](#generating-locale)
         * [Setting locale (system-wide)](#setting-locale-system-wide)
         * [Setting locale (per-user)](#setting-locale-per-user)
      * [Login Keyring (<a href="https://wiki.archlinux.org/index.php/GNOME/Keyring#Using_the_keyring_outside_GNOME" rel="nofollow">ArchWiki</a>)](#login-keyring-archwiki)
      * [Unmute microphone](#unmute-microphone)
      * [VPN](#vpn)
      * [Bluetooth headset](#bluetooth-headset)
      * [ZSH](#zsh)
            * [Add fish-like autosuggestions](#add-fish-like-autosuggestions)
      * [Nvidia Setup](#nvidia-setup)
         * [Driver installation](#driver-installation)
         * [Pacman hook](#pacman-hook)
      * [Power management (<a href="https://wiki.archlinux.org/title/Power_management" rel="nofollow">ArchWiki</a>)](#power-management-archwiki)
         * [GPU power saving (Nvidia only) (<a href="https://wiki.archlinux.org/title/PRIME#PCI-Express_Runtime_D3_(RTD3)_Power_Management" rel="nofollow">ArchWiki</a>)](#gpu-power-saving-nvidia-only-archwiki)
         * [Cpu power saving (Intel only)](#cpu-power-saving-intel-only)
         * [Audio power saving](#audio-power-saving)
         * [Kernel power saving](#kernel-power-saving)
         * [Wi-Fi power saving](#wi-fi-power-saving)

<!-- Added by: pport, at: jue 16 dic 2021 19:32:30 WET -->

<!--te-->

# To-Do

- [x] Nvidia drivers (prime render off-load method)
- [ ] PowerTOP management
- [x] Picom config
- [x] Dunst config
- [x] Base16 management -> [flavours](https://github.com/Misterio77/flavours)
- [ ] Improve this README (check https://github.com/alfunx/.dotfiles)
- [x] Migrate to NeoVim
- [x] See mons to manage monitors -> manual setup with xrandr
- [x] See flameshot scrot replacement
- [x] Bluetooth module polybar

# Programs

| Use                   | Name                  | Description |
| ----                  | ----                  | ---- |
| Graphical server      | xorg                  | FOSS X server protocol implementation |
| Backlight             | xbacklight            | |
| Sound                 | pipewire              | |
| WM                    | bspwm                 | binary-space partition window manager |
| HotKey daemon         | sxhkd                 | simple X hotkey daemon |
| Compositor            | picom                 | The compton fork. Actually ibhawgan's fork |
| Notifications         | dunst                 | Simple notification daemon |
| Bar                   | polybar               | Customizable and light bar |
| Font 1                | IBM Plex Nerd Font    | |
| Font 2 (icons)        | MaterialDesignIcons   | |
| Text editor           | Neovim                | I love vim mood |
| Screenshot tool       | Flameshot             | Fully featured screenshot tool |
| Music server          | mpd                   | Music backend |
| Music client          | ncmpcpp               | Simple but pretty mpd frontend |
| Browser 1             | brave                 | Privacy-focused browser |
| Browser 2             | firefox               | Open source standard browser |
| Browser X             | qutebrowser           | Chromium based browser with vim-like keybindings |

# Wayland setup
Currently I am working to migrate my setup to the newer Wayland protocol. I am experimenting with
different WM (Sway, Qtile and River) and several substitutes for the tools I have used in Xorg.

You can find my progress in the `wayland` branch, which I will merge whenever I am ready to use it
as my daily driver.

# Configs

## Only for XPS 15 7590 ([ArchWiki](https://wiki.archlinux.org/index.php/Dell_XPS_15_7590))

### Default sleep mode
Add `mem_sleep_default=deep` to kernel parameters and rebuild initramfs image.

## Autologin ([ArchWiki](https://wiki.archlinux.org/index.php/Getty#Automatic_login_to_virtual_console))
Execute this command and add the next to the file:

```bash
sudo vim getty@tty1.service.d/override.conf
```

```ini
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --skip-login --nonewline --noissue --autologin USERNAME --noclear %I %TERM
```

## Silent Boot ([ArchWiki](https://wiki.archlinux.org/index.php/Silent_boot))

### Remove kernel messages
Add the next kernel parameters to the bootloader:
```
quiet loglevel=3
rd.systemd.show_status=auto
rd.udev.log_priority=3
```
Rebuild initramfs.

### Remove console cursor blinking
Add ``vt.global_cursor_default=0`` to the kernel parameters.
To recover the cursor in the TTY, run:
```bash
sudo -i
setterm -cursor on >> /etc/issue
```

### Remove last login message
```bash
touch $HOME/hushlogin
```

### Remove fsck messages

Replace ``udev`` with ``systemd`` hook in ``/etc/mkinitcpio.conf`` and update the initramfs image:

```bash
sudo mkinitcpio -p PRESET
```

> INFO: If encryption is in use with ``systemd`` hook, see [this](https://wiki.archlinux.org/index.php/Dm-crypt/System_configuration#mkinitcpio).

Edit this two services:
```bash
sudo systemctl edit --full systemd-fsck-root.service
sudo systemctl edit --full systemd-fsck@.service
```
And configure *StandardOutput* and *StandardError* like this:
```ini
(...)

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/usr/lib/systemd/systemd-fsck
StandardOutput=null
StandardError=journal+console
TimeoutSec=0
```

### Remove getty message (autologin)
Add or modify the override configuration with ``--skip-login --nonewline --noissue``

```bash
sudo systemctl edit getty@tty1
```

```ini
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --skip-login --nonewline --noissue --autologin uSeRnAmE --noclear %I $TERM
```

## Locale configuration ([ArchWiki](https://wiki.archlinux.org/index.php/Locale))
### Generating locale
Uncomment locales in ``/etc/locale.gen``
```
...
#en_SG ISO-8859-1
en_US.UTF-8 UTF-8
#en_US ISO-8859-1
...
```
Save the file and generate the locales:

```bash
sudo locale-gen
```

### Setting locale (system-wide)
Edit and populate the file `/etc/locale.conf`:
```
LANG=en_US.UTF-8
LC_MESSAGES=en_US.UTF-8
LC_TIME=es_ES.UTF-8
LC_COLLATE=C
```
### Setting locale (per-user)

Alternatively, you can set the locale in `~/.config/locale.conf` the same way as system-wide.

> INFO: this is how i'm doing right now.

## Login Keyring ([ArchWiki](https://wiki.archlinux.org/index.php/GNOME/Keyring#Using_the_keyring_outside_GNOME))

Install `gnome-keyring` and `libsecret` package. Optionally `seahorse` for a GUI interface.

If you are using autologin, set a blank password to the default `Login`. But first you need to disable autologin to create the default `Login` keyring. Once it's created, set no password to achieve auto-unlocking.

> WARNING: this leaves the passwords unencrypted. I don't care much because I have full disk encryption. Nevertheless I think it can be obtained by software digging into the filesystem.

Also, add this to `~/.xinitrc` (in my case `bspwmrc`) to autostart the daemon:

```
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
```

> WARNING: There is a bug in my config or the ArchWiki isn't correct, this solved it: https://bbs.archlinux.org/viewtopic.php?id=224652

## Unmute microphone
```bash
pactl set-source-mute 1 toggle
```

## VPN

Install OpenVPN extension:
```bash
yay -S openvpn
```
Download `.ovpn` file and add this line:

```
auth-user-pass auth.txt
```

In the same directory as the `.ovpn` file, create one with the VPN credentials called as setted above:

```
####################### -> username
####################### -> password
```

Connect with the next command:

```bash
sudo openvpn --cd "path/to/config/file/directory" --config "file.ovpn"
```

## Bluetooth headset

Install several packages:

```bash
yay -S bluez bluez-utils pulseaudio-bluetooth
```

> Do not install `pulseaudio-bluetooth` if `pipewire` is used.

In the `bluetoothctl` cli, connect and trust your device:

```
$ bluetoothctl
[bluetoothctl]# scan on
[bluetoothctl]# devices
[bluetoothctl]#connect MAC_ADDRESS
[bluetoothctl]# trust MAC_ADDRESS
```

Uncomment this line in `/etc/pulse/default.pa`:

```
load-module module-switch-on-connect
```

## ZSH

Set default shell to `sh`:

```
$ chsh --shell /bin/sh
```

Modify `/etc/zsh/zshenv` and add this line:

```
export ZDOTDIR="$HOME/.config/shell/zsh"
```

#### Add fish-like autosuggestions

Download the source files in the oh-my-zsh directory:

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Add the plugin in the `.zshrc` file:

```
plugins=(
	...
	zsh-autosuggestions
	...
)
```

## Nvidia Setup

### Driver installation

Install the nvidia driver, nvidia settings and nvidia prime:

```bash
yay -S nvidia nvidia-settings nvidia-prime
```

> Interesting commands:
>
> - Nvidia run: `prime-run`
> - Nvidia resource monitor: `nvidia-smi`

### Pacman hook

To prevent updating the linux kernel or the nvidia driver without making initramfs, create the next file:

- `/etc/pacman.d/hooks/nvidia.hook

```ini
[Trigger]
Operation=Install
Operation=Upgrade
Operation=Remove
Type=Package
Target=nvidia
Target=linux

[Action]
Description=Update Nvidia module in initcpio
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'
```

If you have the `linux-lts` kernel installed, create another one modifying the `Target`'s variables:

- `/etc/pacman.d/hooks/nvidia-lts.hook

```ini
[Trigger]
Operation=Install
Operation=Upgrade
Operation=Remove
Type=Package
Target=nvidia-lts
Target=linux-lts

[Action]
Description=Update Nvidia module in initcpio
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'
```

## Power management ([ArchWiki](https://wiki.archlinux.org/title/Power_management))

### GPU power saving (Nvidia only) ([ArchWiki](https://wiki.archlinux.org/title/PRIME#PCI-Express_Runtime_D3_(RTD3)_Power_Management))

See Arch wiki because of the frequency in updates.

### Cpu power saving (Intel only)

Create this file `/etc/tmpfiles.d/energy_performance_preference.conf`:

```
w /sys/devices/system/cpu/cpufreq/policy?/energy_performance_preference - - - - balance_power
```

### Audio power saving

Create this file `/etc/modprobe.d/audio_powersave.conf`:

```
options snd_hda_intel power_save=1
```

### Kernel power saving

Add the next kernel parameters to the bootloader:

```
nmi_watchdog=0
vm.dirty_writeback_centisecs=6000
```

Rebuild initramfs.

### Wi-Fi power saving

Create this file `/etc/udev/rules.d/81-wifi-powersave.rules`:

```
ACTION=="add", SUBSYSTEM=="net", KERNEL=="wl*", RUN+="/usr/bin/iw dev $name set power_save on"
```

