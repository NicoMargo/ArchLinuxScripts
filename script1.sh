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

timedatectl set-ntp true &&
pacman -Sy archlinux-keyring reflector --noconfirm &&
sed -i 37c"ParallelDownloads = 5" /etc/pacman.conf &&
reflector -a 30 -f 7 -l 15 --sort rate --save /etc/pacman.d/mirrorlist
pacstrap /mnt base linux linux-firmware grub dosfstools vim efibootmgr zsh base-devel neovim nano networkmanager sudo htop intel-ucode --noconfirm &&
#pacstrap /mnt base linux linux-firmware grub dosfstools mtools vim os-prober efibootmgr polkit-gnome tar unrar zsh unzip base-devel neovim nano networkmanager wget thunar thunar-volman tmux thunar-archive-plugin flameshot gvfs gvfs-afc gvfs-smb git archlinux-wallpaper bspwm sxhkd rofi sddm sudo htop materia-gtk-theme alacritty xorg ranger picom intel-ucode ntfs-3g papirus-icon-theme gnome-disk-utility feh rofi linux-headers gthumb gufw fuse2 gtkmm pcsclite libcanberra ncurses firefox tumbler filezilla pulseaudio pavucontrol pulseaudio-alsa alsa-utils --noconfirm &&
genfstab -U /mnt >> /mnt/etc/fstab &&
arch-chroot /mnt ../script2.sh
