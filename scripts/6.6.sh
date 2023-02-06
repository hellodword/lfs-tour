#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/diffutils-3.8-done" ] && exit 0 || echo

cd $LFS/sources
[ ! -d "diffutils-3.8" ] && tar -xf diffutils-3.8.tar.xz

cd diffutils-3.8

./configure --prefix=/usr --host=$LFS_TGT

make

make DESTDIR=$LFS install

touch "$LFS/sources/diffutils-3.8-done"