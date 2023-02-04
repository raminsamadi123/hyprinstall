[![easy-arch-linux-rice-by-linuxmobile.png](https://i.postimg.cc/3N509sYv/easy-arch-linux-rice-by-linuxmobile.png)](https://postimg.cc/wy2Bjbtq)
# Setup
install sway desktop with archinstall (Network Manager)
```
If you know about Arch Linux & archinstall you can skip this step, note that as desktop you must use sway:
https://youtu.be/G-mLyrHonvU
```
## Preparation !!DO THIS AS USER NOT ROOT!!
```sh
sudo pacman -Syu base-devel git python-pip unzip rsync bash-completion fish sddm
mkdir Downloads && cd Downloads/
mkdir _cloned-repos && cd _cloned-repos
git clone https://aur.archlinux.org/paru.git
cd paru/
makepkg -si
```
## Run hyprinstall !!DO THIS AS USER NOT ROOT!! (During xdg-desktop-portal pick xdg-desktop-portal-wlr)
	
```sh
cd && git clone https://github.com/raminsamadi123/hyprinstall
cd hyprinstall/
chmod +x hyprinstall.sh
./hyprinstall.sh
```

### How to Change Keyboard Layout
#### Install Vim or any editor of your choice
```sh
sudo pacman -Syu vim
```
#### Find out what your X11 layout is
```sh
localectl
localectl list-x11-keymap-layouts
```
#### Edit Hyprland Configuration file
```sh
sudo vim ~/.config/hypr/hyprland.conf
```
#### Uncomment these lines under EXEC and INPUT and change it to your x11 layout
Under EXEC:
```sh
#exec-once = echo us > /tmp/kb_layout
```
Under INPUT:
```sh
#kb_layout = us
```
### How to Change Wallpaper
#### Install Vim or any editor of your choice
```sh
sudo pacman -Syu vim
```
#### Find out your monitor's name in terminal
It should look something like ***DP-1*** or ***HDMI-A-1***
```sh
hyprctl monitors
```
#### Edit the hyprpapper.conf in terminal
```sh
sudo vim ~/.config/hypr/hyprpaper.conf
```

## Credits

This is all thanks open source I got this from Chris Titus Tech after watching his long live stream but it was for sure worth it and I learnt a lot. Thanks to everyone contributing to this project.

_Beauty community: [r/unixporn](https://www.reddit.com/r/unixporn)._

**©** _Artist who make Wallpapers, graphics and more_

**©** _All of mantainers of this amazing and opensource tools_

---


© [Owl4ce](https://github.com/owl4ce)
© [Ilham25](https://github.com/ilham25)
© [Siduck](https://github.com/siduck)
© [NvChad](https://github.com/NvChad) 
© [Rxyhn](https://github.com/rxyhn)
© [AmitGold](https://github.com/AmitGolden)
© [linuxmobile](https://github.com/linuxmobile)
© [ChrisTitusTech](https://github.com/ChrisTitusTech)
