#!/bin/bash

cd /opt &&
git clone https://aur.archlinux.org/yay.git &&
cd yay &&
makepkg -si &&
yay -S wps-office visual-studio-code-bin brave-bin vmware-workstation --noconfirm &&
echo "Install grub, see readme"
