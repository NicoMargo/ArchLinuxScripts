#!/bin/bash
source ./config.conf
echo "Timezone:                 $timezone"
echo "Hostname:                 $hostname"
echo "Root Password:            $rootpass"
echo "Username:                 $username"
echo "User password:            $userpass"

while true; do
    read -p "Are you ok with these settings? [y/n] " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) echo 'Then edit config.conf. Canceling installation'; exit;;
        * ) echo "Please answer y or n.";;
    esac
done
umount /dev/sda1
umount /dev/sda2
umount /dev/sda3
mkfs.ext4 /dev/sda3
mount /dev/sda3 /mnt
mkfs.fat -F 32 /dev/sda1
mkswap /dev/sda2 
swapon /dev/sda2 


timedatectl set-ntp true &&
pacman -Sy archlinux-keyring reflector --noconfirm &&
sed -i 37c"ParallelDownloads = 6" /etc/pacman.conf &&
#reflector -a 30 -f 7 -l 15 --sort rate --save /etc/pacman.d/mirrorlist
pacstrap /mnt base linux linux-firmware grub dosfstools wget vim unzip efibootmgr bspwm zsh base-devel sddm git neovim nano archlinux-wallpaper networkmanager sudo thunar thunar-volman htop neofetch intel-ucode materia-gtk-theme papirus-icon-theme sxhkd alacritty picom rofi ranger--noconfirm &&
#pacstrap /mnt base linux linux-firmware grub dosfstools mtools vim os-prober efibootmgr polkit-gnome tar unrar zsh unzip base-devel neovim nano networkmanager wget thunar thunar-volman tmux thunar-archive-plugin neofetch flameshot gvfs gvfs-afc gvfs-smb git archlinux-wallpaper bspwm sxhkd rofi sddm sudo htop materia-gtk-theme alacritty xorg ranger picom intel-ucode ntfs-3g papirus-icon-theme gnome-disk-utility feh rofi linux-headers gthumb gufw fuse2 gtkmm pcsclite libcanberra ncurses firefox tumbler filezilla pulseaudio pavucontrol pulseaudio-alsa alsa-utils --noconfirm &&
genfstab -U /mnt >> /mnt/etc/fstab &&
cp config.conf INSTALLERS
cp -R INSTALLERS /mnt

arch-chroot /mnt ./INSTALLERS/script2.sh
arch-chroot -u ${username}:${username} /mnt /home/${username}/INSTALLERS/script3.sh

#Cleaning
chmod -R 731 /mnt/root
sed -i 's/%wheel ALL=(ALL:ALL) NOPASSWD: ALL/# %wheel ALL=(ALL:ALL) NOPASSWD: ALL/g' /mnt/etc/sudoers
sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/g' /mnt/etc/sudoers
rm -R /mnt/INSTALLERS
