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

bash 8.27.sh

bash 8.28.sh

bash 8.29.sh

bash 8.30.sh

bash 8.31.sh

bash 8.32.sh

bash 8.33.sh

bash 8.34.sh

bash 8.35.sh

bash 8.36.sh

bash 8.37.sh

bash 8.38.sh

bash 8.39.sh

bash 8.40.sh

bash 8.41.sh

bash 8.42.sh

bash 8.43.sh

bash 8.44.sh

bash 8.45.sh

bash 8.46.sh

bash 8.47.sh

bash 8.48.sh

bash 8.49.sh

bash 8.50.sh

bash 8.51.sh

bash 8.52.sh

bash 8.53.sh

bash 8.54.sh

bash 8.55.sh

bash 8.56.sh

bash 8.57.sh

bash 8.58.sh

bash 8.59.sh

bash 8.60.sh

bash 8.61.sh

bash 8.62.sh

bash 8.63.sh

bash 8.64.sh

bash 8.65.sh

bash 8.66.sh

bash 8.67.sh

bash 8.68.sh

bash 8.69.sh

bash 8.70.sh

bash 8.71.sh

bash 8.72.sh

bash 8.73.sh

bash 8.74.sh

bash 8.75.sh

bash 8.76.sh

bash 8.78.sh

bash 8.79.sh