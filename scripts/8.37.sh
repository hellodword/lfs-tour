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
[ ! -d "gperf-3.1" ] && tar -xf gperf-3.1.tar.gz

cd gperf-3.1

./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1

make

make -j1 check

make install

EOT

touch "$LFS/sources/$(basename $0).done"