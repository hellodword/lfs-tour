#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/ncurses-6.3-done" ] && exit 0 || echo

cd $LFS/sources
[ ! -d "ncurses-6.3" ] && tar -xf ncurses-6.3.tar.gz

cd ncurses-6.3

sed -i s/mawk// configure

mkdir build
pushd build
  ../configure
  make -C include
  make -C progs tic
popd

./configure --prefix=/usr                \
            --host=$LFS_TGT              \
            --build=$(./config.guess)    \
            --mandir=/usr/share/man      \
            --with-manpage-format=normal \
            --with-shared                \
            --without-normal             \
            --with-cxx-shared            \
            --without-debug              \
            --without-ada                \
            --disable-stripping          \
            --enable-widec

make

make DESTDIR=$LFS TIC_PATH=$(pwd)/build/progs/tic install
echo "INPUT(-lncursesw)" > $LFS/usr/lib/libncurses.so

touch "$LFS/sources/ncurses-6.3-done"