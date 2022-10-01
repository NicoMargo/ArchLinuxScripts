#!/bin/bash
source ./config.conf
ln -sf /usr/share/zoneinfo/${timezone} /etc/localtime &&
echo "${hostname}" > /etc/hostname 
sed -i 's/#en_US.UTF-8/en_US.UTF-8/g' /etc/locale.gen
sed -i 37c"ParallelDownloads = 5" /etc/pacman.conf &&
sed -i 's/#%wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/g' /etc/locale.gen
locale-gen
hwclock --systohc &&
echo "root:${rootpass}" | chpasswd
useradd -m -G wheel -s /bin/zsh ${username} &&
echo "$username:$userpass" | chpasswd &&
git clone https://github.com/NvChad/NvChad /home/${username}/.config/nvim --depth 1 &&
chsh -s /bin/zsh root &&
systemctl enable sddm NetworkManager &&
mkdir /boot/EFI &&
#reflector -a 30 -f 7 -l 15 --sort rate --save /etc/pacman.d/mirrorlist
sed -i 37c"ParallelDownloads = 5" /etc/pacman.conf &&
sed -i 's/^#[multilib]/[multilib]/' /etc/pacman.conf
sed -i 's/^#Include = /etc/pacman.d/mirrorlist/Include = /etc/pacman.d/mirrorlist/' /etc/pacman.conf
exit
arch-chroot -u ${username}:${username} /mnt ../script3.sh