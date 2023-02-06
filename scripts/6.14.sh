#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/sed-4.8-done" ] && exit 0 || echo

cd $LFS/sources
[ ! -d "sed-4.8" ] && tar -xf sed-4.8.tar.xz

cd sed-4.8

./configure --prefix=/usr   \
            --host=$LFS_TGT

make

make DESTDIR=$LFS install

touch "$LFS/sources/sed-4.8-done"