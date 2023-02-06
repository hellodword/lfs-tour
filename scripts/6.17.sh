#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/binutils-2.39-2nd-done" ] && exit 0 || echo

cd $LFS/sources/binutils-2.39

sed '6009s/$add_dir//' -i ltmain.sh
mkdir -v build-2nd
cd       build-2nd

../configure                   \
    --prefix=/usr              \
    --build=$(../config.guess) \
    --host=$LFS_TGT            \
    --disable-nls              \
    --enable-shared            \
    --enable-gprofng=no        \
    --disable-werror           \
    --enable-64-bit-bfd

make

make DESTDIR=$LFS install

rm -v $LFS/usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes}.{a,la}

touch "$LFS/sources/binutils-2.39-2nd-done"