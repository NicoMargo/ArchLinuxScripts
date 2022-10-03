#!/bin/bash
source ./INSTALLERS/config.conf
git clone https://github.com/NvChad/NvChad /home/${username}/.config/nvim --depth 1 &&
cd /home/${username} &&
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin &&
makepkg -si --noconfirm &&
#yay -S wps-office visual-studio-code-bin brave-bin vmware-workstation --noconfirm &&
yay -S brave-bin --noconfirm 
#-------------DOT FILES---------------
mkdir /home/${username}/INSTALLERS/dotfiles

git clone https://github.com/NicoMargo/MyArchLinuxConfig /home/${username}/INSTALLERS/dotfiles
mv -f /home/${username}/INSTALLERS/dotfiles/* /home/${username}/.config





echo "Install grub, see readme"
