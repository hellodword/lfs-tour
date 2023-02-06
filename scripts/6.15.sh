#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/tar-1.34-done" ] && exit 0 || echo

cd $LFS/sources
[ ! -d "tar-1.34" ] && tar -xf tar-1.34.tar.xz

cd tar-1.34

./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess)

make

make DESTDIR=$LFS install

touch "$LFS/sources/tar-1.34-done"