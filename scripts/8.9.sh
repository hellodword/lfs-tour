#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/zstd-1.5.2-done" ] && exit 0 || echo

sudo chown root:root "$LFS/sources"
sudo chown root:root $LFS/sources/*

sudo chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin \
    /bin/bash --login <<"EOT"

set -x
set -e

cd /sources
[ ! -d "zstd-1.5.2" ] && tar -xf zstd-1.5.2.tar.gz

cd zstd-1.5.2

patch -Np1 -i ../zstd-1.5.2-upstream_fixes-1.patch

make prefix=/usr

make check

make prefix=/usr install

rm -v /usr/lib/libzstd.a

EOT

touch "$LFS/sources/zstd-1.5.2-done"