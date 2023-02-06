#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/xz-5.2.6-done" ] && exit 0 || echo

cd $LFS/sources
[ ! -d "xz-5.2.6" ] && tar -xf xz-5.2.6.tar.xz

cd xz-5.2.6

./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.2.6

make

make DESTDIR=$LFS install

rm -v $LFS/usr/lib/liblzma.la

touch "$LFS/sources/xz-5.2.6-done"