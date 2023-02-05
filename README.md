[![easy-arch-linux-rice-by-linuxmobile.png](https://i.postimg.cc/3N509sYv/easy-arch-linux-rice-by-linuxmobile.png)](https://postimg.cc/wy2Bjbtq)
## Setup

### This projected was created to make Arch Linux ricing easier for people who don't have much time or for people who don't want to do a lot of scripting. It's simple, lightweight (Runs on 400MB idle on my pc from 2015) and beutiful. Special thanks to [linuxmobile](https://github.com/linuxmobile) and [ChrisTitusTech](https://github.com/christitustech)

install Sway desktop with archinstall (NetworkManager) if problems occur try removing your disk's partitions with fdisk or cfdisk and then reboot or you might use pacman-key --init. If you know about Arch Linux & archinstall you can skip this step, note that as desktop you shall use sway with pipewire, multilib and filesystem as EXT4:
https://youtu.be/G-mLyrHonvU

## Run hyprinstall !!DO THIS AS USER NOT ROOT!! 
During xdg-desktop-portal pick xdg-desktop-portal-wlr
If you have a NVIDIA GPU you should type yes when running the script
```sh
sudo pacman -Syu git
cd && git clone https://github.com/raminsamadi123/hyprinstall
cd hyprinstall/
./hyprinstall.sh
```
Make sure to reboot after the whole installation process is complete since some GUI:s might not automatically work on first-launch

<details>

<summary><b>How to Change Keyboard Layout</b></summary>

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

</details>

<details>

<summary><b>How to Change Wallpaper</b></summary>
	
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

	
</details>
	
## Credits

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
