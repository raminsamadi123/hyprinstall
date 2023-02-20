<!--------------------------------------------------------TITLE-------------------------------------------------------------------->
<div align="center">

# **Hyprinstall**
<a href="https://archlinux.org/download"><img src="https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white"/></a>
<a href="https://github.com/raminsamadi123/hyprinstall/blob/main/LICENSE"><img src="https://img.shields.io/github/license/raminsamadi123/hyprinstall?style=for-the-badge&color=83DA82"/></a>
<a href="https://github.com/raminsamadi123/hyprinstall/stargazers"><img src="https://img.shields.io/github/stars/raminsamadi123/hyprinstall?style=for-the-badge&color=83DA82"/></a>
<a href="https://github.com/raminsamadi123/hyprinstall/commits/main"><img src="https://img.shields.io/github/last-commit/raminsamadi123/hyprinstall?style=for-the-badge&color=83DA82"/></a>
![GitHub Repository Size](https://img.shields.io/github/repo-size/raminsamadi123/hyprinstall?style=for-the-badge&color=83DA82)
</div>
<!--------------------------------------------------------------------------------------------------------------------------------->

<img src="https://i.imgur.com/zXzvXef.png">
This project was created to make Arch Linux ricing easier for people who don't have much time or for people who don't want to do a lot of scripting. It's beautiful, simple and lightweight (Runs on 400MB idle on my pc from 2015)

<!--------------------------------------------------------SETUP-------------------------------------------------------------------->
## :arrow_down: Setup :arrow_down:

<details>

<summary><b>Installation</b></summary>

Install Sway desktop with archinstall (NetworkManager) if problems occur try removing your disk's partitions with fdisk or cfdisk and then reboot or you might use pacman-key --init. Note that as desktop you shall use sway with pipewire, multilib and filesystem as EXT4.

## Run hyprinstall !!DO THIS AS USER NOT ROOT!! 
During xdg-desktop-portal pick xdg-desktop-portal-wlr. If you have a NVIDIA GPU you should type Nvidia when running the script else press enter to continue. Remeber to check the dropdown menus below if any problems occur
```sh
sudo pacman -Syu git
cd && git clone https://github.com/raminsamadi123/hyprinstall
cd ~/hyprinstall/
./hyprinstall.sh
```
If Hyprland is not automatically launching and you only get into tty try run this:
```sh
systemctl daemon-reload && systemctl enable --now getty@tty1.service && source ~/.bash_profile && reboot
```
</details>

<!--------------------------------------------------------------------------------------------------------------------------------->

<!--------------------------------------------------------KEYBOARD----------------------------------------------------------------->
## :keyboard: Keyboard :keyboard:
<details>

<summary><b>Keybind</b></summary>

| Key                                    | Action                                  |
| -------------------------------------- | --------------------------------------- |
| <kbd>SUPER                             | App Launcher                            |
| <kbd>SUPER + .                         | Emoji                                   |
| <kbd>SUPER + Q                         | Quit                                    |
| <kbd>SUPER + F                         | Fullscreen			           |
| <kbd>SUPER + Right/Left                | Focus Window		                   |
| <kbd>SUPER + SHIFT + Right/Left        | Switch Window Position	           |
| <kbd>SUPER + 1-0                       | Change Workspace                        |
| <kbd>SUPER + SHIFT + 1-0               | Move Window to Workspace                |
| <kbd>SUPER + X                         | Power Menu                              |
| <kbd>SUPER + SHIFT + S                 | Screenshot                              |
| <kbd>SUPER + SHIFT + X                 | Colorpicker (Install grim slurp zenity) |
| <kbd>SUPER + T                         | Terminal                                |
| <kbd>SUPER + E                         | File Manager (Install thunar)           |
| <kbd>SUPER + L                         | Lock Screen                             |
| <kbd>SUPER + Mouse left button + Drag  | Drag Window                             |
</details>

<details>

<summary><b>Change Keyboard Layout</b></summary>

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
#### Under EXEC & INPUT change se to your x11 layout
Under EXEC:
```sh
exec-once = echo se > /tmp/kb_layout
```
Under INPUT:
```sh
kb_layout = se
```

</details>
<!--------------------------------------------------------------------------------------------------------------------------------->

<!--------------------------------------------------------Monitor------------------------------------------------------------------>
## :desktop_computer: Monitor :desktop_computer:
<details>

<summary><b>Change Monitor Position/Resolution/Refresh Rate</b></summary>

#### Install Vim or any editor of your choice
```sh
sudo pacman -Syu vim
```
#### Find your monitors output (It should look something like this if you use Display Port DP-1. For HDMI it's something else)
```sh
wl-randr
```
#### Edit Hyprland Configuration file
```sh
sudo vim ~/.config/hypr/hyprland.conf
```
#### Under MONITOR change monitor=,preferred,auto,1 to your preference
```sh
monitor=,preferred,auto,1
```
#### Here are some examples (Thanks to [SinisterSpatula](https://github.com/SinisterSpatula)) :
```sh
#monitor=name, resolution, position, scale
monitor=DP-5, 2560x1440, 1920x0, 1.25
monitor=DP-6, 1920x1080, 0x0, 1
```
For highest resolution:
```sh
monitor=,highres,auto,1
```
For highest refresh rate:
```sh
monitor=,highrr,auto,1
```
For more specific information visit https://wiki.hyprland.org/Configuring/Monitors/ 

</details>
<!--------------------------------------------------------------------------------------------------------------------------------->

<!--------------------------------------------------------WALLPAPER---------------------------------------------------------------->
## :city_sunset: Wallpaper :city_sunset:
<details>

<summary><b>Change Wallpaper</b></summary>
	
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
<!--------------------------------------------------------------------------------------------------------------------------------->

<!--------------------------------------------------------NVIDIA------------------------------------------------------------------->
## <a href="#"><img style="width: 30px;" src="https://i.imgur.com/WZoR2bK.png" /></a> NVIDIA <a href="#"><img style="width: 30px;" src="https://i.imgur.com/WZoR2bK.png" /></a>

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
<!--------------------------------------------------------------------------------------------------------------------------------->
	
<!--------------------------------------------------------VIRTUAL MACHINE---------------------------------------------------------->
## <a href="#"><img style="width: 40px;" src="https://i.imgur.com/SMGkUEX.png" /></a> Virtual Machine <a href="#"><img style="width: 40px;" src="https://i.imgur.com/SMGkUEX.png" /></a>
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

### You may also want to try this
```sh
sudo pacman -Syu egl-wayland lib32-libva
sudo sh -c "echo 'LIBSEAT_BACKEND=logind' >> /etc/environment"
echo '
export XDG_SESSION_TYPE=wayland
export LIBSEAT_BACKEND=logind
export WLR_NO_HARDWARE_CURSORS=1
export WLR_RENDERER_ALLOW_SOFTWARE=1 Hyprland
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
export WLR_RENDERER_ALLOW_SOFTWARE=1 Hyprland
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
```

https://unix.stackexchange.com/questions/656328/libseat-backend-seatd-c70-could-not-connect-to-socket-run-seatd-sock-no-su
https://github.com/swaywm/sway/issues/5834
https://ask.fedoraproject.org/t/cant-switch-back-to-x11/19640
https://bbs.archlinux.org/viewtopic.php?id=164391
https://www.reddit.com/r/hyprland/comments/y5fc5e/how_can_i_wrapping_the_launcher/

</details>
<!--------------------------------------------------------------------------------------------------------------------------------->

<!--------------------------------------------------------OPTIONAL CONFIGURATION--------------------------------------------------->
## :wrench: Optional Configuration :wrench:
<details>

<summary><b>How to get a working colorpicker?</b></summary>
Note that I didn't enable this by default during installation in order to make your device more lightweight

### Install dependencies and then press (SUPER + SHIFT + X) and click somewhere to pick the color
```sh
sudo pacman -Syu grim slurp zenity
```
</details>
<details>

<summary><b>Silent-boot for systemd-bootctl</b></summary>
	
### Install an editor of your choice
```sh
sudo pacman -Syu vim
```
### Edit your entries .conf file (Mine looks like this)
```sh
sudo vim /boot/loader/entries/2023-02-05_21-29-22_linux.conf
```
### add this at the end of options rw quiet splash loglevel=0 (it should look something like this)
```sh
options root=PARTUUID=a49e02ad-bb32-476d-b200-4812aafcd87f zswap.enabled=0 rw intel_pstate=no_hwp rootfstype=ext4 rw quiet splash loglevel=0
```
### Update your bootctl
```sh
sudo bootctl update
```

</details>

<details>

<summary><b>Silent-boot for grub</b></summary>
	
### Install an editor of your choice
```sh
sudo pacman -Syu vim
```
### Edit your entries grub file
```sh
sudo vim /etc/default/grub
```
### Add loglevel=0 in between quiet splashscreen (like this)
```sh
GRUB_CMDLINE_LINUX_DEFAULT="quiet loglevel=0 splash"
```
### Update your grub
```sh
grub-mkconfig -o /boot/grub/grub.cfg
```

</details>

<details>

<summary><b>How to remove timeout during systemd boot</b></summary>
	
### Run this in your terminal
```sh
sudo sh -c "echo -e '#timeout 3\n#console-mode keep' > /boot/loader/loader.conf" 
```

</details>

<details>

<summary><b>How to remove timeout during grub boot</b></summary>
	
### Install an editor of your choice
```sh
sudo pacman -Syu vim 
```
### Edit your grub file
```sh
sudo vim /etc/default/grub 
```
### Change GRUB_TIMEOUT to be equal to 0
```sh
GRUB_TIMEOUT=0 
```
### Update grub
```sh
grub-mkconfig -o /boot/grub/grub.cfg
```

</details>
</details>
<!--------------------------------------------------------------------------------------------------------------------------------->

<!--------------------------------------------------------CREDIT------------------------------------------------------------------->
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
<!--------------------------------------------------------------------------------------------------------------------------------->
