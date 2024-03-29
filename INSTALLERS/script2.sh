#!/bin/bash
source ./INSTALLERS/config.conf
ln -sf /usr/share/zoneinfo/${timezone} /etc/localtime &&
echo "${hostname}" > /etc/hostname 
chmod -R 777 /root
sed -i 's/#en_US.UTF-8/en_US.UTF-8/g' /etc/locale.gen
sed -i 37c"ParallelDownloads = 5" /etc/pacman.conf &&
sed -i 's/# %wheel ALL=(ALL:ALL) NOPASSWD: ALL/%wheel ALL=(ALL:ALL) NOPASSWD: ALL/g' /etc/sudoers
locale-gen
hwclock --systohc &&
echo "root:${rootpass}" | chpasswd
useradd -m ${username} -G wheel &&
echo "$username:$userpass" | chpasswd &&
chsh -s /bin/zsh root &&
chsh -s /bin/zsh ${username} &&
systemctl enable sddm NetworkManager &&
#---------------GRUB------------------
mkdir /boot/EFI &&
mount /dev/sda1 /boot/EFI
grub-install --target=x86_64-efi --bootloader-id=Arch &&
grub-mkconfig -o /boot/grub/grub.cfg &&
#---------------FONTS-----------------
wget -P /usr/share/fonts/TTF https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Terminus.zip
cd /usr/share/fonts/TTF 
unzip Terminus.zip


#reflector -a 30 -f 7 -l 15 --sort rate --save /etc/pacman.d/mirrorlist
sed -i 37c"ParallelDownloads = 5" /etc/pacman.conf &&
#sed -i 's/^#[multilib]/[multilib]/' /etc/pacman.conf
#sed -i 's/^#Include = /etc/pacman.d/mirrorlist/Include = /etc/pacman.d/mirrorlist/' /etc/pacman.conf
cp -R /INSTALLERS /home/${username}
chmod 777 -R /home/${username}/INSTALLERS

