#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/gzip-1.12-done" ] && exit 0 || echo

cd $LFS/sources
[ ! -d "gzip-1.12" ] && tar -xf gzip-1.12.tar.xz

cd gzip-1.12

./configure --prefix=/usr --host=$LFS_TGT

make

make DESTDIR=$LFS install

touch "$LFS/sources/gzip-1.12-done"