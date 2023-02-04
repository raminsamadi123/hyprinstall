## Setup
```
To get started head over to:
1. https://arch.linux.org/downloads
2. Install the Arch ISO file closest to you
3. Flash the ISO to a USB flash drive using Balena Etcher https://www.balena.io/etcher
4. Put the USB flash drive in your computer's USB port
5. Access your computers UEFI by searching on Google "[ComputerModel] bios key", example: "[HP] bios key"
6. Select your bootable USB flash drive
7. write lsblk
8. fdisk /dev/sda
9. press d and delete all of your partitions
10. When you are done press w and hit enter
11. write reboot
12. Get into your USB again go back to step 5 if you forgot
13. 
```

## Preparation
```sh
sudo pacman -Syu base-devel git python-pip unzip rsync bash-completion fish sddm
mkdir Downloads && cd Downloads/
mkdir _cloned-repos && cd _cloned-repos
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

#### Run hyprinstall
	
```sh
cd && git clone https://github.com/raminsamadi123/hyprinstall
cd hyprinstall
chmod +x ./hyprinstall.sh
./hyprinstall.sh
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
