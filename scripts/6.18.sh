#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/gcc-12.2.0-2nd-done" ] && exit 0 || echo

cd $LFS/sources/gcc-12.2.0

sed '/thread_header =/s/@.*@/gthr-posix.h/' \
    -i libgcc/Makefile.in libstdc++-v3/include/Makefile.in

mkdir build-2nd
cd build-2nd

../configure                                       \
    --build=$(../config.guess)                     \
    --host=$LFS_TGT                                \
    --target=$LFS_TGT                              \
    LDFLAGS_FOR_TARGET=-L$PWD/$LFS_TGT/libgcc      \
    --prefix=/usr                                  \
    --with-build-sysroot=$LFS                      \
    --enable-initfini-array                        \
    --disable-nls                                  \
    --disable-multilib                             \
    --disable-decimal-float                        \
    --disable-libatomic                            \
    --disable-libgomp                              \
    --disable-libquadmath                          \
    --disable-libssp                               \
    --disable-libvtv                               \
    --enable-languages=c,c++

time -p make

make DESTDIR=$LFS install

ln -sv gcc $LFS/usr/bin/cc

touch "$LFS/sources/gcc-12.2.0-2nd-done"