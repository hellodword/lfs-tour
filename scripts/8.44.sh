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
[ ! -d "autoconf-2.71" ] && tar -xf autoconf-2.71.tar.xz

cd autoconf-2.71

./configure --prefix=/usr

make

make check TESTSUITEFLAGS=-j7

make install

EOT

touch "$LFS/sources/$(basename $0).done"