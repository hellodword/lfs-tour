#! /bin/bash

set -x
set -e


[ ! -d "~/.bash_profile" ] && cat > ~/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF

[ ! -d "~/.bash_profile" ] && cat > ~/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/usr/bin
if [ ! -L /bin ]; then PATH=/bin:$PATH; fi
PATH=$LFS/tools/bin:$PATH
CONFIG_SITE=$LFS/usr/share/config.site
MAKEFLAGS='-j7'
export LFS LC_ALL LFS_TGT PATH CONFIG_SITE MAKEFLAGS
EOF

# source ~/.bash_profile
