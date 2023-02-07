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
[ ! -d "groff-1.22.4" ] && tar -xf groff-1.22.4.tar.gz

cd groff-1.22.4

PAGE=A4 ./configure --prefix=/usr

make -j1

make install

EOT

touch "$LFS/sources/$(basename $0).done"