#!/bin/bash

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc
sed -i '$ a en_US.UTF-8 UTF-8' /etc/locale.gen

cat /etc/locale.conf << "EOF"
LANG=en_US.UTF-8
EOF

mkinitcpio -P

source "/tools/userconfig.sh"


pacman -S --noconfirm git base-devel go grub efibootmgr openssh networkmanager btrfs-progs zsh proxychains wget

#desktop
pacman -S --noconfirm xorg xf86-video-intel mesa lightdm lightdm-gtk-greeter xfce4

sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/g' /etc/sudoers
sed -i '$d' /etc/proxychains.conf
sed -i '$d' /etc/proxychains.conf
sed -i '$ a socks5 192.168.110.111 1082' /etc/proxychains.conf

systemctl enable NetworkManager
systemctl enable sshd
systemctl enable lightdm

#grub
mkdir /boot/EFI
grub-install --target=x86_64-efi --efi-directory=/boot --recheck
grub-mkconfig -o /boot/grub/grub.cfg


passwd << EOF
archr
archr
EOF

useradd -m -g users -G wheel name
passwd name << EOF
archu
archu
EOF

exit
