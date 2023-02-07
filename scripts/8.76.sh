#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/$(basename $0).done" ] && exit 0 || echo

sudo chown root:root "$LFS/sources"
sudo chown root:root $LFS/sources/*

sudo chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin \
    /bin/bash --login <<"EOT"

set -x
set -e

cd /sources
[ ! -d "sysvinit-3.04" ] && tar -xf sysvinit-3.04.tar.xz

cd sysvinit-3.04

patch -Np1 -i ../sysvinit-3.04-consolidated-1.patch

make

make install

EOT

touch "$LFS/sources/$(basename $0).done"