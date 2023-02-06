#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/m4-1.4.19-done" ] && exit 0 || echo

cd $LFS/sources
[ ! -d "m4-1.4.19" ] && tar -xf m4-1.4.19.tar.xz

cd m4-1.4.19

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

make

make DESTDIR=$LFS install

touch "$LFS/sources/m4-1.4.19-done"