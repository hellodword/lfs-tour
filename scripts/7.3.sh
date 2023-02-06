#! /bin/bash

set -x
set -e

sudo mkdir -pv $LFS/{dev,proc,sys,run}

mountpoint -q -- $LFS/dev || sudo mount -v --bind /dev $LFS/dev

mountpoint -q -- $LFS/dev/pts || sudo mount -v --bind /dev/pts $LFS/dev/pts
mountpoint -q -- $LFS/proc || sudo mount -vt proc proc $LFS/proc
mountpoint -q -- $LFS/sys || sudo mount -vt sysfs sysfs $LFS/sys
mountpoint -q -- $LFS/run || sudo mount -vt tmpfs tmpfs $LFS/run

if [ -h $LFS/dev/shm ]; then
  sudo mkdir -pv $LFS/$(readlink $LFS/dev/shm)
fi