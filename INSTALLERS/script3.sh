#!/bin/bash
source ./INSTALLERS/config.conf
cd /home/${username} &&
#git clone https://aur.archlinux.org/yay-bin.git
#cd yay-bin &&
#makepkg -si --noconfirm &&
#yay -S wps-office visual-studio-code-bin brave-bin vmware-workstation --noconfirm &&
#yay -S brave-bin --noconfirm 

#-------------DOT FILES---------------cd
mkdir /home/${username}/INSTALLERS/dotfiles
sleep 3
pwd
sleep 3
git clone https://github.com/NicoMargo/MyArchLinuxConfig /home/${username}/INSTALLERS/dotfiles
sleep 2
mv -f /home/${username}/INSTALLERS/dotfiles/* /home/${username}/.config
sleep 2
git clone https://github.com/NvChad/NvChad /home/${username}/.config/nvim --depth 1 &&






echo "Install grub, see readme"
