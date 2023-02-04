!#/bin/bash
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
