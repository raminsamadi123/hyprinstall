#!/bin/bash

echo "What are you using? (Type Nvidia or if none press enter):"
read graphics

sudo pacman -Rns foot htop swaylock waybar dmenu

sudo pacman -Syu base-devel git unzip rsync intel-ucode amd-ucode gvfs linux-headers

mkdir Downloads && cd Downloads/ && mkdir _cloned-repos && cd _cloned-repos && git clone https://aur.archlinux.org/paru.git && cd paru/ && makepkg -si

paru -Syu hyprland-bin polkit-gnome polkit-kde-agent dunst rofi rofi-emoji wl-clipboard-rs wl-clipboard-x11 wf-recorder wlogout grimblast-git mingetty hyprpaper-git xdg-desktop-portal-hyprland-git wtype imagemagick swaylock-effects qt5-wayland qt6-wayland waybar-hyprland-git playerctl pavucontrol starship noise-suppression-for-voice wezterm pamixer wlr-randr wtype noto-fonts-emoji

if [[ "$graphics" =~ ^[nN][vV][iI][dD][iI][aA]$ ]]; then
sudo pacman -Syu nvidia-dkms nvidia-utils nvidia-settings qt5ct libva
	paru -Syu nvidia-vaapi-driver-git
	echo '
    export LIBVA_DRIVER_NAME=nvidia
    export XDG_SESSION_TYPE=wayland
    export GBM_BACKEND=nvidia-drm
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export WLR_NO_HARDWARE_CURSORS=1
    export CURSOR_INACTIVE_TIMEOUT=0
    ' >> ~/.bashrc && source ~/.bashrc
    sudo sh -c "echo '
    MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
    BINARIES=()
    FILES=()
    HOOKS=(base udev autodetect keyboard keymap modconf block filesystems fsck)' > /etc/mkinitcpio.conf"
    sudo mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-custom.img
    sudo sh -c "echo 'options nvidia-drm modeset=1' > /etc/modprobe.d/nvidia.conf"
    echo '
    #!/usr/bin/env bash
    # wrappedhl
    # Launch Hyprland with a simple wrapper
    cd ~
    # Variables
    export _JAVA_AWT_WM_NONREPARENTING=1
    export XCURSOR_SIZE=24
    export LIBVA_DRIVER_NAME=nvidia
    export XDG_SESSION_TYPE=wayland
    export GBM_BACKEND=nvidia-drm
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export WLR_NO_HARDWARE_CURSORS=1
    export CURSOR_INACTIVE_TIMEOUT=0
    export NO_CURSOR_WARPS=0
    exec systemd-cat --identifier=hyprland /usr/bin/Hyprland $@
    # Execute Hyprland
    if [ -f /usr/local/bin/Hyprland ]; then
       exec /usr/local/bin/Hyprland >/dev/null 2>&1
    elif [ -f /usr/bin/Hyprland ]; then
       exec /usr/bin/Hyprland >/dev/null 2>&1
    fi' > ~/.local/bin/wrappedhl
fi

sudo sh -c "echo 'LIBSEAT_BACKEND=logind' >> /etc/environment"
git clone https://github.com/raminsamadi123/hyprinstall $HOME/Downloads/hyprinstall/
cd $HOME/Downloads/hyprinstall/
rsync -avxHAXP --exclude '.git*' .* ~/
mkdir -p $HOME/Downloads/nerdfonts/
cd $HOME/Downloads/
wget https://github.com/raminsamadi123/hyprinstall/releases/download/Fonts/CascadiaCode.zip
wget https://github.com/raminsamadi123/hyprinstall/files/10593769/cartograph-cf-v2.zip
unzip '*.zip' -d $HOME/Downloads/nerdfonts/
rm -rf *.zip
sudo cp -R $HOME/Downloads/nerdfonts/ /usr/share/fonts/
fc-cache -rv

sudo mkdir /etc/systemd/system/getty@tty1.service.d 
sudo touch override.conf /etc/systemd/system/getty@tty1.service.d/
sudo sh -c "echo -e '[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $USER %I \$TERM\nType=idle' > /etc/systemd/system/getty@tty1.service.d/override.conf" 
sudo cp ~/.local/bin/wrappedhl /usr/share/wayland-sessions/wrapped_hl.desktop
echo '
#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ "$(tty)" == "/dev/tty1" ]]
then
   /usr/share/wayland-sessions/wrapped_hl.desktop
fi
' > ~/.bash_profile && source ~/.bash_profile
sudo sh -c "echo -e '[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $USER %I \$TERM\nType=idle' > /etc/systemd/system/getty@tty1.service.d/override.conf" 
echo '
#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ "$(tty)" == "/dev/tty1" ]]
then
   /usr/share/wayland-sessions/wrapped_hl.desktop
fi
' > ~/.bash_profile && source ~/.bash_profile
sudo chmod +x /usr/share/wayland-sessions/wrapped_hl.desktop

systemctl daemon-reload
systemctl enable --now getty@tty1.service
source ~/.bash_profile

reboot
