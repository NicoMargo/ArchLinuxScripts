#!/bin/bash
source ./INSTALLERS/config.conf

cd /home/${username} &&
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin &&
makepkg -si --noconfirm &&
yay -S wps-office visual-studio-code-bin brave-bin vmware-workstation --noconfirm &&


grub-install --target=x86_64-efi --bootloader-id=Arch &&
grub-mkconfig -o /boot/grub/grub.cfg && 
sed -i 's/%wheel ALL=(ALL:ALL) NOPASSWD: ALL/%# wheel ALL=(ALL:ALL) NOPASSWD: ALL/g' /etc/sudoers
sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/g' /etc/sudoers


echo "Install grub, see readme"
