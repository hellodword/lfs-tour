#! /bin/bash

set -x
set -e


[ -f "$HOME/lfs-temp-tools-11.2.tar.xz" ] && exit 0 || echo

sudo chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin \
    /bin/bash --login <<"EOT"

set -x
set -e

rm -rf /usr/share/{info,man,doc}/*

rm -rf /tools

EOT

find "$LFS/sources" -mindepth 1 -maxdepth 1 -type d | xargs -L 1 sudo rm -rf

mountpoint -q -- $LFS/dev/pts && sudo umount $LFS/dev/pts || echo
mountpoint -q -- $LFS/sys && sudo umount $LFS/sys || echo
mountpoint -q -- $LFS/proc && sudo umount $LFS/proc || echo
mountpoint -q -- $LFS/run && sudo umount $LFS/run || echo
mountpoint -q -- $LFS/dev && sudo umount $LFS/dev || echo


cd $LFS
sudo tar -cJpf $HOME/lfs-temp-tools-11.2.tar.xz .

[ ! -z "$LFS" ]

cd $LFS
# sudo chown root:root $LFS
sudo rm -rf ./*
sudo tar -xpf $HOME/lfs-temp-tools-11.2.tar.xz