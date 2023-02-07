#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/$(basename $0).done" ] && exit 0 || echo

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
[ ! -d "coreutils-9.1" ] && tar -xf coreutils-9.1.tar.xz

cd coreutils-9.1

patch -Np1 -i ../coreutils-9.1-i18n-1.patch

autoreconf -fiv
FORCE_UNSAFE_CONFIGURE=1 ./configure \
            --prefix=/usr            \
            --enable-no-install-program=kill,uptime

make

make NON_ROOT_USERNAME=tester check-root

echo "dummy:x:102:tester" >> /etc/group

chown -Rv tester . 

su tester -c "PATH=$PATH make RUN_EXPENSIVE_TESTS=yes check"

sed -i '/dummy/d' /etc/group

make install

mv -v /usr/bin/chroot /usr/sbin
mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8


cd /sources/acl-2.3.1
make check

EOT

touch "$LFS/sources/$(basename $0).done"