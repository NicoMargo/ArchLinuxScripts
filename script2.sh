#!/bin/bash
ln -sf /usr/share/zoneinfo/America/Buenos_Aires /etc/localtime &&
sed -i 's/#en_US.UTF-8/en_US.UTF-8/g' /etc/locale.gen
sed -i 's/#%wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/g' /etc/locale.gen
locale-gen
hwclock --systohc &&
pacman-optimize &&
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 &&
chsh -s /bin/zsh root &&
systemctl enable sddm NetworkManager &&
mkdir /boot/EFI &&
exit