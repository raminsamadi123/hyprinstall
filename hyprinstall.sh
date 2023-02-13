#!/bin/bash
echo "Are you using NVIDIA? (y) if not press enter to continue:"
read graphics

echo 'Installing these with pacman: base-devel git python-pip unzip rsync intel-ucode amd-ucode bash-completion gvfs linux-headers' && sleep 2
sudo pacman -Syu base-devel git python-pip unzip rsync intel-ucode amd-ucode bash-completion gvfs linux-headers

echo 'Installing paru from source https://aur.archlinux.org/paru.git' && sleep 2
mkdir Downloads && cd Downloads/ && mkdir _cloned-repos && cd _cloned-repos && git clone https://aur.archlinux.org/paru.git && cd paru/ && makepkg -si

echo 'Installing these with paru: hyprland-bin sddm-git polkit-gnome ffmpeg swaybg polkit-kde-agent dunst rofi rofi-emoji wl-clipboard-rs wl-clipboard-x11 wf-recorder wlogout grimblast-git hyprpicker-git hyprpaper-git xdg-desktop-portal-hyprland-git ffmpegthumbnailer tumbler wtype colord imagemagick swaylock-effects qt5-wayland qt6-wayland ripgrep waybar-hyprland-git catppuccin-gtk-theme-mocha catppuccin-cursors-mocha playerctl nwg-look cava pavucontrol starship feh noise-suppression-for-voice thunar thunar-archive-plugin file-roller wezterm pamixer wlr-randr wtype ttf-twr noto-fonts-emoji' && sleep 2
paru -S hyprland-bin sddm-git polkit-gnome ffmpeg swaybg polkit-kde-agent dunst rofi rofi-emoji wl-clipboard-rs wl-clipboard-x11 wf-recorder wlogout grimblast-git hyprpicker-git hyprpaper-git xdg-desktop-portal-hyprland-git ffmpegthumbnailer tumbler wtype colord imagemagick swaylock-effects qt5-wayland qt6-wayland ripgrep waybar-hyprland-git catppuccin-gtk-theme-mocha catppuccin-cursors-mocha playerctl nwg-look cava pavucontrol starship feh noise-suppression-for-voice thunar thunar-archive-plugin file-roller wezterm pamixer wlr-randr wtype ttf-twr noto-fonts-emoji

echo 'Installing these with pip: clang-tidy dulwich requests datetime' && sleep 2
pip install clang-tidy dulwich requests datetime

if [[ "$graphics" =~ ^[yY]$ ]]; then
echo 'Installing these with pacman: nvidia-dkms nvidia-utils nvidia-settings qt5ct libva' && sleep 2
sudo pacman -Syu nvidia-dkms nvidia-utils nvidia-settings qt5ct libva
	
	
	echo 'Installing these with paru: nvidia-vaapi-driver-git' && sleep 2
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
    sudo sh -c "echo 'LIBSEAT_BACKEND=logind' >> /etc/environment"
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
    echo 'hyprinstalling Nvidia completed' && sleep 5
fi

echo 'Installing fonts' && sleep 2
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

sudo pacman -Syu flatpak bat strace neofetch thefuck tldr vlc kdenlive lshw ncdu btop traceroute curl tree trash-cli cronie vi electron
cd && git clone https://aur.archlinux.org/yay-bin
cd yay-bin
makepkg -si && cd
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo sh -c "echo -e '\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist' >> /etc/pacman.conf"
git clone https://github.com/christitustech/mybash
cd mybash/
./setup-arch.sh
cd && git clone https://github.com/raminsamadi123/hyprinstall/releases/download/Fonts/Meslo-fonts.zip
unzip Meslo-fonts.zip
git clone --recursive https://github.com/akinomyoga/ble.sh.git
make -C ble.sh
source ble.sh/out/ble.sh
git clone --recursive https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
echo 'source ~/.local/share/blesh/ble.sh' >> ~/.bashrc
sudo pacman -Syu motrix-bin spotify
echo "
#Easy Aliases
alias update='sudo pacman -Syu --noconfirm && flatpak update -y'
alias install='sudo pacman -Syu'
alias search='sudo pacman -Ss'
alias uninstall='sudo pacman -Rns --noconfirm'
alias cls='clear'
alias clean='sudo pacman -Scc'
alias explain='tldr'
alias packages='sudo pacman -Qe'
alias bios='systemctl reboot --firmware-setup'
bind -x '\"\\C-l\": \"clear; neofetch\"'
neofetch
" >> ~/.bashrc && source ~/.bashrc
yay -S jpegoptim optipng imagemagick libwebp -y && git clone https://github.com/VirtuBox/img-optimize.git $HOME/.img-optimize && sudo ln -s $HOME/.img-optimize/optimize.sh /usr/local/bin/img-optimize && sudo chmod +x /usr/local/bin/img-optimize && echo "
#Image Optimization
alias optimize='~/.img-optimize/optimize.sh'
" >> ~/.bashrc && source ~/.bashrc
sudo bash -c "echo '58,18 * * * * update' >> /var/spool/cron/root"
sudo systemctl stop cronie && sudo systemctl enable cronie.service && sudo systemctl start cronie.service

echo 'Rebooting in 3 seconds..' && sleep 3

reboot
