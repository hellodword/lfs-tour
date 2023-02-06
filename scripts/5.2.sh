#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/binutils-2.39-done" ] && exit 0 || echo

cd $LFS/sources
[ ! -d "binutils-2.39" ] && tar -xf binutils-2.39.tar.xz
[ ! -d "binutils-2.39/build" ] && mkdir -v binutils-2.39/build

cd binutils-2.39/build

../configure --prefix=$LFS/tools \
        --with-sysroot=$LFS \
        --target=$LFS_TGT   \
        --disable-nls       \
        --enable-gprofng=no \
        --disable-werror

time -p make

make install

touch "$LFS/sources/binutils-2.39-done"