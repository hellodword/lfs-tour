#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/findutils-4.9.0-done" ] && exit 0 || echo

cd $LFS/sources
[ ! -d "findutils-4.9.0" ] && tar -xf findutils-4.9.0.tar.xz

cd findutils-4.9.0

./configure --prefix=/usr   \
            --localstatedir=/var/lib/locate \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

make

make DESTDIR=$LFS install

touch "$LFS/sources/findutils-4.9.0-done"