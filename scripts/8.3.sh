#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/man-pages-5.13-done" ] && exit 0 || echo

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
[ ! -d "man-pages-5.13" ] && tar -xf man-pages-5.13.tar.xz

cd man-pages-5.13

make prefix=/usr install

EOT

touch "$LFS/sources/man-pages-5.13-done"