#!/bin/bash

echo "What are you using? (Nvidia / VirtualBox / If none of these press enter):"
read graphics

echo 'Preparing for installation..' && sleep 5
sudo pacman -Syu base-devel git python-pip unzip rsync intel-ucode amd-ucode bash-completion fish gvfs sddm linux-headers
mkdir Downloads && cd Downloads/
mkdir _cloned-repos && cd _cloned-repos
git clone https://aur.archlinux.org/paru.git
cd paru/
makepkg -si
paru -S hyprland-bin sddm-git polkit-gnome ffmpeg swaybg polkit-kde-agent dunst grimblast rofi rofi-emoji wl-clipboard wf-recorder wlogout grimblast-git hyprpicker-git hyprpaper-git xdg-desktop-portal-hyprland-git ffmpegthumbnailer tumbler wtype colord imagemagick swaylock-effects qt5-wayland qt6-wayland ripgrep waybar-hyprland-git catppuccin-gtk-theme-mocha catppuccin-cursors-mocha catppuccin-mocha-grub-theme-git playerctl nwg-look cava pavucontrol ranger zsh starship neovim viewnior noise-suppression-for-voice thunar thunar-archive-plugin file-roller wezterm pamixer wlr-randr wtype ttf-twemoji-color noto-fonts-emoji
pip install clang-tidy dulwich requests datetime
echo 'Preparation completed' && sleep 5

if [[ "$graphics" =~ ^[nN][vV][iI][dD][iI][aA]$ ]]; then
echo 'hyprinstall for NVIDIA' && sleep 5
sudo pacman -Syu nvidia-dkms nvidia-utils nvidia-settings qt5ct libva
	paru -S nvidia-vaapi-driver-git
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
    sudo cp ~/.local/bin/wrappedhl /usr/share/wayland-sessions/wrapped_hl.desktop
    echo 'hyprinstall Nvidia completed' && sleep 5
elif [[ "$graphics" =~ ^[vV][iI][rR][tT][uU][aA][lL][bB][oO][xX]$ ]]; then
    echo 'hyprinstall for VirtualBox' && sleep 5
    sudo sh -c "echo 'LIBSEAT_BACKEND=logind' >> /etc/environment"
    echo '
    export XDG_SESSION_TYPE=wayland
    export LIBSEAT_BACKEND=logind
    export WLR_NO_HARDWARE_CURSORS=1
    ' >> ~/.bashrc && source ~/.bashrc
    echo '
    #!/usr/bin/env bash
    # wrappedhl
    # Launch Hyprland with a simple wrapper
    cd ~
    # Variables
    export _JAVA_AWT_WM_NONREPARENTING=1
    export XCURSOR_SIZE=24
    export MOZ_ENABLE_WAYLAND=1
    export LIBSEAT_BACKEND=logind
    export WLR_NO_HARDWARE_CURSORS=1
    export QT_QPA_PLATFORM=wayland
    export QT_QPA_PLATFORMTHEME=gtk2
    export SDL_VIDEODRIVER=wayland
    export CLUTTER_BACKEND=wayland  
    exec Hyprland
    # Execute Hyprland
    if [ -f /usr/local/bin/Hyprland ]; then
       exec /usr/local/bin/Hyprland >/dev/null 2>&1
    elif [ -f /usr/bin/Hyprland ]; then
       exec /usr/bin/Hyprland >/dev/null 2>&1
    fi' > ~/.local/bin/wrappedhl
    sudo cp ~/.local/bin/wrappedhl /usr/share/wayland-sessions/wrapped_hl.desktop
    echo 'hyprinstall VirtualBox completed' && sleep 5
fi

echo 'hyprinstalling fonts and fixing known bugs' && sleep 5
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
chmod +x ~/.config/waybar/scripts/waybar-wttr.py
sudo systemctl enable sddm
sudo sh -c "echo -e '[Autologin]\nUser=$USER\nSession=hyprland' > /etc/sddm.conf"
systemctl start sddm
