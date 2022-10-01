#!/bin/bash
timedatectl set-ntp true &&
pacman -Sy archlinux-keyring &&
pacstrap /mnt base linux linux-firmware grub dosfstools mtools vim os-prober efibootmgr zsh base-devel neovim nano networkmanager sudo htop intel-ucode --noconfirm &&
#pacstrap /mnt base linux linux-firmware grub dosfstools mtools vim os-prober efibootmgr polkit-gnome tar unrar zsh unzip base-devel neovim nano networkmanager wget thunar thunar-volman tmux thunar-archive-plugin flameshot gvfs gvfs-afc gvfs-smb git archlinux-wallpaper bspwm sxhkd rofi sddm sudo htop materia-gtk-theme alacritty xorg ranger picom intel-ucode ntfs-3g papirus-icon-theme gnome-disk-utility feh rofi linux-headers gthumb gufw fuse2 gtkmm pcsclite libcanberra ncurses firefox tumbler filezilla pulseaudio pavucontrol pulseaudio-alsa alsa-utils --noconfirm &&
genfstab -U /mnt >> /mnt/etc/fstab &&
arch-chroot /mnt ./script2.sh
