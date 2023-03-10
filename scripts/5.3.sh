#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/gcc-12.2.0-done" ] && exit 0 || echo

cd $LFS/sources
[ ! -d "gcc-12.2.0" ] && tar -xf gcc-12.2.0.tar.xz
[ ! -d "gcc-12.2.0/build" ] && mkdir -v gcc-12.2.0/build

cd gcc-12.2.0
[ ! -d "mpfr" ] && tar -xf ../mpfr-4.1.0.tar.xz && mv -v mpfr-4.1.0 mpfr
[ ! -d "gmp" ] && tar -xf ../gmp-6.2.1.tar.xz && mv -v gmp-6.2.1 gmp
[ ! -d "mpc" ] && tar -xf ../mpc-1.2.1.tar.gz && mv -v mpc-1.2.1 mpc

case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
 ;;
esac

cd build

../configure                  \
    --target=$LFS_TGT         \
    --prefix=$LFS/tools       \
    --with-glibc-version=2.36 \
    --with-sysroot=$LFS       \
    --with-newlib             \
    --without-headers         \
    --disable-nls             \
    --disable-shared          \
    --disable-multilib        \
    --disable-decimal-float   \
    --disable-threads         \
    --disable-libatomic       \
    --disable-libgomp         \
    --disable-libquadmath     \
    --disable-libssp          \
    --disable-libvtv          \
    --disable-libstdcxx       \
    --enable-languages=c,c++

time -p make

make install

cd ..
cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
  `dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/install-tools/include/limits.h

touch "$LFS/sources/gcc-12.2.0-done"