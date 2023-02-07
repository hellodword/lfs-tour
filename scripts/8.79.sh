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

rm -rf /tmp/*

find /usr/lib /usr/libexec -name \*.la -delete

find /usr -depth -name $(uname -m)-lfs-linux-gnu\* | xargs rm -rf

userdel -r tester

EOT

touch "$LFS/sources/$(basename $0).done"