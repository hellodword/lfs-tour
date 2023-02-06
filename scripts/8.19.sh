#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/gmp-6.2.1-done" ] && exit 0 || echo

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
[ ! -d "gmp-6.2.1" ] && tar -xf gmp-6.2.1.tar.xz

cd gmp-6.2.1

cp -v configfsf.guess config.guess
cp -v configfsf.sub   config.sub

./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/gmp-6.2.1

make
make html

make check 2>&1 | tee gmp-check-log

[ $(awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log) == 197 ]

make install
make install-html

EOT

touch "$LFS/sources/gmp-6.2.1-done"