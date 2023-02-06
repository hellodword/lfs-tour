#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/flex-2.6.4-done" ] && exit 0 || echo

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
[ ! -d "flex-2.6.4" ] && tar -xf flex-2.6.4.tar.gz

cd flex-2.6.4

./configure --prefix=/usr \
            --docdir=/usr/share/doc/flex-2.6.4 \
            --disable-static

make

make check

make install

ln -sv flex /usr/bin/lex

EOT

touch "$LFS/sources/flex-2.6.4-done"