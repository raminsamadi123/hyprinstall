# Setup
install sway desktop with archinstall
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
cd paru
makepkg -si
```

## Run hyprinstall
	
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
