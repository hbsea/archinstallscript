arch_DISK="$1"

fdisk "$arch_DISK" << EOF
#efi partition
g
n


+256M
t
1
p

#root partition
n



p
w
q
EOF

mkfs.vfat -F 32 "${arch_DISK}1"
mkfs.btrfs -f "${arch_DISK}2"
mount "${arch_DISK}2" "/mnt/"
mount --mkdir "${arch_DISK}1" "/mnt/boot"
