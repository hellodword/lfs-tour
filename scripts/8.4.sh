#! /bin/bash

set -x
set -e

[ -f "$LFS/sources/iana-etc-20220812-done" ] && exit 0 || echo

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
[ ! -d "iana-etc-20220812" ] && tar -xf iana-etc-20220812.tar.gz

cd iana-etc-20220812

cp services protocols /etc

EOT

touch "$LFS/sources/iana-etc-20220812-done"