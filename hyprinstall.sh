#!/bin/bash
echo "Do you use NVIDIA graphics card? (yes/no):"
read graphics

if [[ "$graphics" =~ ^[yY][eE][sS]$ ]]; then
    sudo pacman -Syu base-devel git python-pip unzip rsync bash-completion fish sddm intel-ucode amd-ucode mesa mesa-utils gvfs nvidia-dkms nvidia-utils nvidia-settings linux-headers qt5-wayland qt5ct libva
    mkdir Downloads && cd Downloads/
    mkdir _cloned-repos && cd _cloned-repos
    git clone https://aur.archlinux.org/paru.git
    cd paru/
    makepkg -si
    paru -S hyprland-bin polkit-gnome ffmpeg swaybg polkit-kde-agent dunst nvidia-vaapi-driver-git grimblast rofi rofi-emoji wl-clipboard wf-recorder wlogout grimblast-git hyprpicker-git hyprpaper-git xdg-desktop-portal-hyprland-git ffmpegthumbnailer tumbler wtype colord imagemagick swaylock-effects qt5-wayland qt6-wayland ripgrep waybar-hyprland-git catppuccin-gtk-theme-mocha catppuccin-cursors-mocha catppuccin-mocha-grub-theme-git playerctl nwg-look cava pavucontrol ranger zsh starship neovim viewnior noise-suppression-for-voice thunar thunar-archive-plugin file-roller wezterm pamixer wlr-randr wtype ttf-twemoji-color noto-fonts-emoji
    pip install clang-tidy dulwich requests datetime
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
    echo "
    export LIBVA_DRIVER_NAME=nvidia
    export XDG_SESSION_TYPE=wayland
    export GBM_BACKEND=nvidia-drm
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export WLR_NO_HARDWARE_CURSORS=1
    export CURSOR_INACTIVE_TIMEOUT=0
    " >> ~/.bashrc && source ~/.bashrc
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
    exec Hyprland
    # Execute Hyprland
    if [ -f /usr/local/bin/Hyprland ]; then
       exec /usr/local/bin/Hyprland >/dev/null 2>&1
    elif [ -f /usr/bin/Hyprland ]; then
       exec /usr/bin/Hyprland >/dev/null 2>&1
    fi' > ~/.local/bin/wrappedhl
    sudo cp ~/.local/bin/wrappedhl /usr/share/wayland-sessions/wrapped_hl.desktop
    sudo systemctl enable sddm
    sudo sh -c "echo -e '[Autologin]\nUser=$USER\nSession=hyprland' > /etc/sddm.conf"
    systemctl start sddm
elif [[ "$graphics" =~ ^[nN][oO]$ ]]; then
    sudo pacman -Syu base-devel git python-pip unzip rsync intel-ucode amd-ucode bash-completion fish gvfs sddm linux-headers
    mkdir Downloads && cd Downloads/
    mkdir _cloned-repos && cd _cloned-repos
    git clone https://aur.archlinux.org/paru.git
    cd paru/
    makepkg -si
    paru -S hyprland-bin polkit-gnome ffmpeg swaybg polkit-kde-agent dunst grimblast rofi rofi-emoji wl-clipboard wf-recorder wlogout grimblast-git hyprpicker-git hyprpaper-git xdg-desktop-portal-hyprland-git ffmpegthumbnailer tumbler wtype colord imagemagick swaylock-effects qt5-wayland qt6-wayland ripgrep waybar-hyprland-git catppuccin-gtk-theme-mocha catppuccin-cursors-mocha catppuccin-mocha-grub-theme-git playerctl nwg-look cava pavucontrol ranger zsh starship neovim viewnior noise-suppression-for-voice thunar thunar-archive-plugin file-roller wezterm pamixer wlr-randr wtype ttf-twemoji-color noto-fonts-emoji
    pip install clang-tidy dulwich requests datetime
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
else
    echo "Invalid choice, please choose either yes or no."
    exit 1
fi
