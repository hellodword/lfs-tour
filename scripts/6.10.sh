#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/grep-3.7-done" ] && exit 0 || echo

cd $LFS/sources
[ ! -d "grep-3.7" ] && tar -xf grep-3.7.tar.xz

cd grep-3.7

./configure --prefix=/usr   \
            --host=$LFS_TGT

make

make DESTDIR=$LFS install

touch "$LFS/sources/grep-3.7-done"