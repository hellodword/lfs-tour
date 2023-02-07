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
[ ! -d "libpipeline-1.5.6" ] && tar -xf libpipeline-1.5.6.tar.gz

cd libpipeline-1.5.6

./configure --prefix=/usr

make

make check

make install

EOT

touch "$LFS/sources/$(basename $0).done"