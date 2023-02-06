#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/file-5.42-done" ] && exit 0 || echo

cd $LFS/sources
[ ! -d "file-5.42" ] && tar -xf file-5.42.tar.gz

cd file-5.42

mkdir build
pushd build
  ../configure --disable-bzlib      \
               --disable-libseccomp \
               --disable-xzlib      \
               --disable-zlib
  make
popd

./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess)

make FILE_COMPILE=$(pwd)/build/src/file

make DESTDIR=$LFS install

rm -v $LFS/usr/lib/libmagic.la

touch "$LFS/sources/file-5.42-done"