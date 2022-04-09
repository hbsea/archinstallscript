#start

#修改镜像

rm  /etc/pacman.d/mirrorlist

cat > /etc/pacman.d/mirrorlist << "EOF"

Server = http://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch

Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch

Server = https://mirrors.aliyun.com/archlinux/$repo/os/$arch

Server = http://mirrors.aliyun.com/archlinux/$repo/os/$arch

EOF

#pacman多线程

sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 8/g' /etc/pacman.conf

pacman -Sy --noconfirm git proxychains

sed -i '$d' /etc/proxychains.conf

sed -i '$d' /etc/proxychains.conf

sed -i '$ a socks5 192.168.110.111 1082' /etc/proxychains.conf

proxychains git clone https://github.com/hbsea/archinstallscript.git

cd archinstallscript

bash arch.sh

#####################################################

#finish

cd

export GOPROXY=https://goproxy.io

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si

#shell oh my zsh

sudo chsh -s /bin/zsh

proxychains wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

yay -S --noconfirm  autofs exfat-utils \
                    flameshot vlc calibre feh gimp aria2 testdisk crontab \
                    mlocate vim  tmux ntfs-3g  gvfs \
                    rofi intel-ucode wqy-microhei ibus ibus-rime firefox
