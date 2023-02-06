#! /bin/bash

set -x
set -e

sudo chown -R root:root $LFS/{usr,lib,var,etc,bin,sbin}

sudo chown -R root:root $LFS/tools || echo

case $(uname -m) in
  x86_64) sudo chown -R root:root $LFS/lib64 ;;
esac
