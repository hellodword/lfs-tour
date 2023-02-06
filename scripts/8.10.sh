#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/file-5.42-2nd-done" ] && exit 0 || echo

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
[ ! -d "file-5.42" ] && tar -xf file-5.42.tar.gz

cd file-5.42

./configure --prefix=/usr

make

make check

make install

EOT

touch "$LFS/sources/file-5.42-2nd-done"