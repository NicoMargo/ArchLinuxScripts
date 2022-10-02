#!/bin/bash
source ./INSTALLERS/config.conf
git clone https://github.com/NvChad/NvChad /home/${username}/.config/nvim --depth 1 &&
cd /home/${username} &&
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin &&
makepkg -si --noconfirm &&
#yay -S wps-office visual-studio-code-bin brave-bin vmware-workstation --noconfirm &&
yay -S wps-office --noconfirm 

grub-install --target=x86_64-efi --bootloader-id=Arch4 &&
grub-mkconfig -o /boot/grub/grub.cfg && 



echo "Install grub, see readme"
