#!/bin/bash
source ./INSTALLERS/config.conf
cd /home/${username} &&
#git clone https://aur.archlinux.org/yay-bin.git
#cd yay-bin &&
#makepkg -si --noconfirm &&
#yay -S wps-office visual-studio-code-bin brave-bin vmware-workstation --noconfirm &&
#yay -S brave-bin --noconfirm 

#-------------DOT FILES---------------
cd /home/${username}
mkdir .config
git clone --depth=1 https://github.com/NicoMargo/MyArchLinuxConfig .config
git clone --depth=1 https://github.com/adi1090x/rofi.git
chmod +x rofi/setup.sh
rofi/setup.sh
rm -r rofi
git clone https://github.com/NvChad/NvChad /home/${username}/.config/nvim --depth 1
