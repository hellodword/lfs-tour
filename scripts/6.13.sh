#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/patch-2.7.6-done" ] && exit 0 || echo

cd $LFS/sources
[ ! -d "patch-2.7.6" ] && tar -xf patch-2.7.6.tar.xz

cd patch-2.7.6

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

make

make DESTDIR=$LFS install

touch "$LFS/sources/patch-2.7.6-done"