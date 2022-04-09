#!/bin/bash

export arch_DISK=/dev/sda

source ./setupdisk.sh "$arch_DISK"

source ./userconfig.sh

pacstrap /mnt base linux #linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab

mkdir /mnt/tools
cp -rf *.sh /mnt/tools
chmod ugo+x /mnt/tools/*.sh
arch-chroot /mnt \
    /bin/bash -c "/tools/insidechroot.sh"
umount -R /mnt
reboot
