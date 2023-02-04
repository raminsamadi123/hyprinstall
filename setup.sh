#!/bin/bash
sudo pacman -Syu base-devel git python-pip unzip rsync bash-completion fish sddm
mkdir Downloads && cd Downloads/
mkdir _cloned-repos && cd _cloned-repos
git clone https://aur.archlinux.org/paru.git
cd paru/
makepkg -si
