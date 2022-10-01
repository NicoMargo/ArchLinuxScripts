#!/bin/bash

cd /opt &&
git clone https://aur.archlinux.org/yay.git &&
cd yay &&
makepkg -si &&
yay -S wps-office visual-studio-code-bin brave-bin vmware-workstation --noconfirm &&
grub-install --target=x86_64-efi --bootloader-id=Arch &&
grub-mkconfig -o /boot/grub/grub.cfg && 
exit
