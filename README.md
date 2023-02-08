[![easy-arch-linux-rice-by-linuxmobile.png](https://i.postimg.cc/3N509sYv/easy-arch-linux-rice-by-linuxmobile.png)](https://postimg.cc/wy2Bjbtq)
## Setup

### This projected was created to make Arch Linux ricing easier for people who don't have much time or for people who don't want to do a lot of scripting. It's simple, lightweight (Runs on 400MB idle on my pc from 2015) and beutiful. Special thanks to [linuxmobile](https://github.com/linuxmobile) and [ChrisTitusTech](https://github.com/christitustech)

install Sway desktop with archinstall (NetworkManager) if problems occur try removing your disk's partitions with fdisk or cfdisk and then reboot or you might use pacman-key --init. If you know about Arch Linux & archinstall you can skip this step, note that as desktop you shall use sway with pipewire, multilib and filesystem as EXT4:
https://youtu.be/G-mLyrHonvU

## Run hyprinstall !!DO THIS AS USER NOT ROOT!! 
During xdg-desktop-portal pick xdg-desktop-portal-wlr. If you have a NVIDIA GPU you should type yes when running the script, if not type no. Remeber to check the dropdown menus below if any problems occur
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

</details>

<details>

<summary><b>How to fix no cursor or dissapearing cursor on NVIDIA install</b></summary>
	
#### Open your terminal and run the command below
```sh
echo "
    export LIBVA_DRIVER_NAME=nvidia
    export XDG_SESSION_TYPE=wayland
    export GBM_BACKEND=nvidia-drm
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export WLR_NO_HARDWARE_CURSORS=1
    export CURSOR_INACTIVE_TIMEOUT=0
    " >> ~/.bashrc && source ~/.bashrc
```
#### Reboot
```sh
reboot
```

</details>

<details>

<summary><b>Problems in Virtualmachine?</b></summary>
	
#### Here's some articles if you really want to run it in a VM. Remeber that you need to enable 3D acceleration.
### Quick tip: Go into tty by pressing ctrl+alt+(F2-F6) and run: 

```sh
Hyprland
```

### If you are on VMware install these
```sh
sudo pacman -Syu open-vm-tools xf86-input-vmouse xf86-video-vmware
```

https://unix.stackexchange.com/questions/656328/libseat-backend-seatd-c70-could-not-connect-to-socket-run-seatd-sock-no-su
https://github.com/swaywm/sway/issues/5834
https://ask.fedoraproject.org/t/cant-switch-back-to-x11/19640
https://bbs.archlinux.org/viewtopic.php?id=164391
https://www.reddit.com/r/hyprland/comments/y5fc5e/how_can_i_wrapping_the_launcher/

</details>

<details>

<summary><b>Configure extra fast boot time</b></summary>
	
### Install mingetty
```sh
paru -Syu mingetty
```
### Uninstall sddm or sddm-git
```sh
paru -Rns sddm && paru -Rns sddm-git
```
### Create override.conf for your tty1 (if problems occur try changing -/sbin/agetty to -/sbin/mgetty or -/sbin/getty
```sh
sudo sh -c "echo -e '[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $USER %I \$TERM\nType=idle' > /etc/systemd/system/getty@tty1.service.d/override.conf" 
```
### Make wrappedhl.desktop an executable
```sh
sudo chmod +x /usr/share/wayland-sessions/wrapped_hl.desktop
```
### Make Hyprland run automatically on startup
```sh
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
