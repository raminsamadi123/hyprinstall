<div align="center">

# **Hyprinstall**

![GitHub Repo stars](https://img.shields.io/github/stars/raminsamadi123/hyprinstall?style=for-the-badge&color=83DA82) 
![GitHub last commit](https://img.shields.io/github/last-commit/raminsamadi123/hyprinstall?style=for-the-badge&color=83DA82) 
![GitHub repo size](https://img.shields.io/github/repo-size/raminsamadi123/hyprinstall?style=for-the-badge&color=83DA82)
<br/>
</div>

<img src="https://i.imgur.com/zXzvXef.png">

## Setup

### This projected was created to make Arch Linux ricing easier for people who don't have much time or for people who don't want to do a lot of scripting. It's simple, lightweight (Runs on 400MB idle on my pc from 2015) and beutiful. Special thanks to [linuxmobile](https://github.com/linuxmobile) and [ChrisTitusTech](https://github.com/christitustech)

install Sway desktop with archinstall (NetworkManager) if problems occur try removing your disk's partitions with fdisk or cfdisk and then reboot or you might use pacman-key --init. If you know about Arch Linux & archinstall you can skip this step, note that as desktop you shall use sway with pipewire, multilib and filesystem as EXT4:
https://youtu.be/G-mLyrHonvU

## Run hyprinstall !!DO THIS AS USER NOT ROOT!! 
During xdg-desktop-portal pick xdg-desktop-portal-wlr. If you have a NVIDIA GPU you should type Nvidia when running the script, if in virtual machine type VirtualBox, if none of these press enter to continue. Remeber to check the dropdown menus below if any problems occur
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

### All-in-One Command installation
```sh
paru -Syu mingetty && paru -Rns sddm-git && sudo sh -c "echo -e '[Service]\nExecStart=\nExecStart=-/sbin/agetty --noissue --autologin $USER %I \$TERM\nType=idle' > /etc/systemd/system/getty@tty1.service.d/override.conf" && sudo chmod +x /usr/share/wayland-sessions/wrapped_hl.desktop && echo '
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
	
### Install mingetty
```sh
paru -Syu mingetty
```
### Uninstall sddm-git
```sh
paru -Rns sddm-git
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

<details>

<summary><b>How to get color picker (Workaround if hyprpicker does not work)</b></summary>

https://youtu.be/dmIWCFe3B-Q
### Install an editor of your choice
```sh
sudo pacman -Syu vim 
```
### Install dependencies
```sh
sudo pacman -Syu zenity slurp grim
```
### Make a file called colorpicker.sh (NO SUDO)
```sh
vim colorpicker.sh
```
### Paste this in the file (colorpicker.sh)
```sh
#!/bin/bash
#
# License: MIT
#
# A script to easily pick a color on a wayland session by using:
# slurp to select the location, grim to get the pixel, convert
# to make the pixel a hex number and zenity to display a nice color
# selector dialog where the picked color can be tweaked further.
#
# The script was possible thanks to the useful information on:
# https://www.trst.co/simple-colour-picker-in-sway-wayland.html
# https://unix.stackexchange.com/questions/320070/is-there-a-colour-picker-that-works-with-wayland-or-xwayland/523805#523805
#

# Check if running under wayland.
if [ "$WAYLAND_DISPLAY" = "" ]; then
    zenity  --error --width 400 \
        --title "No wayland session found." \
        --text "This color picker must be run under a valid wayland session."

    exit 1
fi

# Get color position
position=$(slurp -b 00000000 -p)

# Sleep at least for a second to prevet issues with grim always
# returning improper color.
sleep 1

# Store the hex color value using graphicsmagick or imagemagick.
if command -v /usr/bin/gm &> /dev/null; then
    color=$(grim -g "$position" -t png - \
        | /usr/bin/gm convert - -format '%[pixel:p{0,0}]' txt:- \
        | tail -n 1 \
        | rev \
        | cut -d ' ' -f 1 \
        | rev
    )
else
    color=$(grim -g "$position" -t png - \
        | convert - -format '%[pixel:p{0,0}]' txt:- \
        | tail -n 1 \
        | cut -d ' ' -f 4
    )
fi

if [ "$1" == "clipboard" ]; then
	echo $color | wl-copy -n
else
	# Display a color picker and store the returned rgb color
	rgb_color=$(zenity --color-selection \
	    --title="Copy color to Clipboard" \
	    --color="${color}"
	)

	# Execute if user didn't click cancel
	if [ "$rgb_color" != "" ]; then
	    # Convert rgb color to hex
	    hex_color="#"
	    for value in $(echo "${rgb_color}" | grep -E -o -m1 '[0-9]+'); do
       		hex_color="$hex_color$(printf "%.2x" $value)"
	    done

    	# Copy user selection to clipboard
    	echo $hex_color | wl-copy -n
	fi
fi
```
### Make it executable
```sh
sudo chmod 744 colorpicker.sh
```
### Bind a keybind to it by editing ~/.config/hypr/hyprland.conf
```sh
sudo vim ~/.config/hypr/hyprland.conf
```
### Change hyprpicker -a -n to this (It's under #MISC) save the file and press (SUPER + SHIFT + X) and pick a color
```sh
bind = SUPERSHIFT, X, exec, ~/test/colorpicker.sh
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
