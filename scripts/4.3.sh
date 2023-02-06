#! /bin/bash

set -x
set -e

getent group lfs || sudo groupadd lfs
id lfs || sudo useradd -s /bin/bash -g lfs -m -k /dev/null lfs && echo -e "$PASSWORD\n$PASSWORD" | sudo passwd lfs

sudo chown -v lfs:lfs $LFS/{usr{,/*},lib,var,etc,bin,sbin}
case $(uname -m) in
  x86_64) sudo chown -v lfs:lfs $LFS/lib64 ;;
esac

# damn
sudo chown -R lfs:lfs $LFS/bin
sudo chown -R lfs:lfs $LFS/etc
sudo chown -R lfs:lfs $LFS/lib
sudo chown -R lfs:lfs $LFS/lib64
sudo chown -R lfs:lfs $LFS/sbin
sudo chown -R lfs:lfs $LFS/sources
sudo chown -R lfs:lfs $LFS/tools || echo
sudo chown -R lfs:lfs $LFS/usr
sudo chown -R lfs:lfs $LFS/var