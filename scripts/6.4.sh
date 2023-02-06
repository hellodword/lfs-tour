#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/bash-5.1.16-done" ] && exit 0 || echo

cd $LFS/sources
[ ! -d "bash-5.1.16" ] && tar -xf bash-5.1.16.tar.gz

cd bash-5.1.16

./configure --prefix=/usr                   \
            --build=$(support/config.guess) \
            --host=$LFS_TGT                 \
            --without-bash-malloc

make

make DESTDIR=$LFS install

ln -sv bash $LFS/bin/sh

touch "$LFS/sources/bash-5.1.16-done"