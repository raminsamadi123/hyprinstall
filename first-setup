!#/bin/bash
pacman -Syu base-devel git python-pip unzip rsync bash-completion fish
mkdir Downloads && cd Downloads/
mkdir _cloned-repos && cd _cloned-repos
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
