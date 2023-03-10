#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/make-4.3-done" ] && exit 0 || echo

cd $LFS/sources
[ ! -d "make-4.3" ] && tar -xf make-4.3.tar.gz

cd make-4.3

./configure --prefix=/usr   \
            --without-guile \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

make

make DESTDIR=$LFS install

touch "$LFS/sources/make-4.3-done"