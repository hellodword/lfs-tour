#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/gcc-12.2.0-libstdc++-v3-done" ] && exit 0 || echo

cd $LFS/sources/gcc-12.2.0
[ ! -d "libstdc++-v3-build" ] && mkdir -v libstdc++-v3-build

cd libstdc++-v3-build

../libstdc++-v3/configure           \
    --host=$LFS_TGT                 \
    --build=$(../config.guess)      \
    --prefix=/usr                   \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/12.2.0

time -p make

make DESTDIR=$LFS install

rm -v $LFS/usr/lib/lib{stdc++,stdc++fs,supc++}.la

touch "$LFS/sources/gcc-12.2.0-libstdc++-v3-done"