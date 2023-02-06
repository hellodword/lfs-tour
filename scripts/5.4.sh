#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/linux-5.19.2-done" ] && exit 0 || echo

cd $LFS/sources
[ ! -d "linux-5.19.2" ] && tar -xf linux-5.19.2.tar.xz

cd linux-5.19.2

make mrproper
make headers
find usr/include -type f ! -name '*.h' -delete
cp -rv usr/include $LFS/usr

touch "$LFS/sources/linux-5.19.2-done"