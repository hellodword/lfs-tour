#! /bin/bash

set -x
set -e

source 2.6.sh

bash version-check.sh

mountpoint -q -- /mnt/lfs

if [ ! -f "$LFS/sources/ch-3-done" ]; then
    bash 3.1.sh

    sudo touch "$LFS/sources/ch-3-done"
fi

if [ ! -f "$LFS/sources/ch-4-done" ]; then
    bash 4.2.sh

    bash 4.3.sh

    sudo -H -u lfs bash -c 'echo "I am $USER, with uid $UID"'

    sudo -H -u lfs bash -i 4.4.sh

    sudo touch "$LFS/sources/ch-4-done"
fi

if [ ! -f "$LFS/sources/ch-5-done" ]; then
    sudo -H -u lfs bash -i 5.2.sh

    sudo -H -u lfs bash -i 5.3.sh

    sudo -H -u lfs bash -i 5.4.sh

    sudo -H -u lfs bash -i 5.5.sh

    sudo -H -u lfs bash -i 5.6.sh

    sudo touch "$LFS/sources/ch-5-done"
fi

if [ ! -f "$LFS/sources/ch-6-done" ]; then

    sudo -H -u lfs bash -i 6.2.sh

    sudo -H -u lfs bash -i 6.3.sh

    sudo -H -u lfs bash -i 6.4.sh

    sudo -H -u lfs bash -i 6.5.sh

    sudo -H -u lfs bash -i 6.6.sh

    sudo -H -u lfs bash -i 6.7.sh

    sudo -H -u lfs bash -i 6.8.sh

    sudo -H -u lfs bash -i 6.9.sh

    sudo -H -u lfs bash -i 6.10.sh

    sudo -H -u lfs bash -i 6.11.sh

    sudo -H -u lfs bash -i 6.12.sh

    sudo -H -u lfs bash -i 6.13.sh

    sudo -H -u lfs bash -i 6.14.sh

    sudo -H -u lfs bash -i 6.15.sh

    sudo -H -u lfs bash -i 6.16.sh

    sudo -H -u lfs bash -i 6.17.sh

    sudo -H -u lfs bash -i 6.18.sh

    sudo touch "$LFS/sources/ch-6-done"
fi

bash 7.2.sh

bash 7.3.sh

bash 7.5.sh

bash 7.6.sh

bash 7.7.sh

bash 7.8.sh

bash 7.9.sh

bash 7.10.sh

bash 7.11.sh

bash 7.12.sh

bash 7.12.sh

bash 7.13.sh

bash 8.3.sh

bash 8.4.sh

bash 8.5.sh

bash 8.6.sh

bash 8.7.sh

bash 8.8.sh

bash 8.9.sh

bash 8.10.sh

bash 8.11.sh

bash 8.12.sh

bash 8.13.sh

bash 8.14.sh

bash 8.15.sh

bash 8.16.sh

bash 8.17.sh

bash 8.18.sh

bash 8.19.sh

bash 8.20.sh

bash 8.21.sh

bash 8.22.sh

bash 8.23.sh

bash 8.24.sh

bash 8.25.sh

bash 8.26.sh