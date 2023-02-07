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
[ ! -d "libtool-2.4.7" ] && tar -xf libtool-2.4.7.tar.xz

cd libtool-2.4.7

./configure --prefix=/usr

make

# TODO after automake
# make check TESTSUITEFLAGS=-j7

make install

rm -fv /usr/lib/libltdl.a

EOT

touch "$LFS/sources/$(basename $0).done"