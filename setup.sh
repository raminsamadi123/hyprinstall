#!/bin/bash
sudo pacman -Syu base-devel git python-pip
sudo pacman -Rns waybar
git clone https://aur.archlinux.org/yay-bin
cd yay-bin
makepkg -si
sudo pacman -U yay-bin-11.3.2-1-x86_64.pkg.tar.zst

git clone https://github.com/linuxmobile/hyprland-dots.git ~/

yay -S hyprland-git polkit-gnome ffmpeg neovim viewnior dunst rofi pavucontrol ranger zsh starship wl-clipboard wf-recorder swaybg grimblast-git ffmpegthumbnailer tumbler playerctl noise-suppression-for-voice thunar unzip wezterm wlr-randr waybar-hyprland-git paru-bin sddm-git
mkdir -p $HOME/Downloads/nerdfonts/
cd $HOME/Downloads/
wget https://github.com/ryanoasis/nerd-fonts/releases/download/2.2.0-RC/CascadiaCode.zip
unzip ‘*.zip’ -d $HOME/Downloads/nerdfonts/
rm -rf *.zip
sudo cp -R $HOME/Downloads/nerdfonts/ /usr/share/fonts/
fc-cache -rv

mv README.md setup
chmod +x setup
./setup

cd
sudo rm -rf .config
cd hyprland-dots
mv .config ~/

cd ~/Downloads/nerdfonts
mkdir ~/.fonts
mv * ~/.fonts/
fc-cache -vf

pip install dulwich
pip install requests
pip install datetime

sudo systemctl enable sddm
systemctl start sddm
