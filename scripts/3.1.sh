#! /bin/bash

set -x
set -e

[ ! -d "$LFS/sources" ] && sudo mkdir -v $LFS/sources
sudo chmod -v a+wt $LFS/sources

pushd $LFS/sources
  md5sum -c md5sums && exit || echo
popd

wget --output-document=/mnt/lfs/sources/md5sums https://www.linuxfromscratch.org/lfs/view/stable/md5sums

wget --output-document=/tmp/wget-list-sysv https://www.linuxfromscratch.org/lfs/view/stable/wget-list-sysv
wget --input-file=/tmp/wget-list-sysv --continue --directory-prefix=$LFS/sources || echo

# vulnerable
wget --output-document=$LFS/sources/expat-2.4.8.tar.xz https://prdownloads.sourceforge.net/expat/expat-2.4.8-RENAMED-VULNERABLE-PLEASE-USE-2.5.0-INSTEAD.tar.xz
wget --output-document=$LFS/sources/zlib-1.2.12.tar.xz https://src.fedoraproject.org/repo/pkgs/zlib/zlib-1.2.12.tar.xz/sha512/12940e81e988f7661da52fa20bdc333314ae86a621fdb748804a20840b065a1d6d984430f2d41f3a057de0effc6ff9bcf42f9ee9510b88219085f59cbbd082bd/zlib-1.2.12.tar.xz

pushd $LFS/sources
  md5sum -c md5sums
popd
