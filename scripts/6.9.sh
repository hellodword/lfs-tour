#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/gawk-5.1.1-done" ] && exit 0 || echo

cd $LFS/sources
[ ! -d "gawk-5.1.1" ] && tar -xf gawk-5.1.1.tar.xz

cd gawk-5.1.1

sed -i 's/extras//' Makefile.in

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)

make

make DESTDIR=$LFS install

touch "$LFS/sources/gawk-5.1.1-done"