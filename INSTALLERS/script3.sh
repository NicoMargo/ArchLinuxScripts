#!/bin/bash

cd ~/ &&
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin &&
makepkg -si --noconfirm &&
yay -S wps-office visual-studio-code-bin brave-bin vmware-workstation --noconfirm &&
echo "Install grub, see readme"
