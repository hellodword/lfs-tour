FROM ubuntu:focal

RUN apt update && \
    apt install -y \
        build-essential gcc make \
        autoconf pkgconf \
        gawk \
        python3 python3-dev \
        texinfo \
        bison

# ERROR: /bin/sh does not point to bash
RUN echo "dash dash/sh boolean false" | debconf-set-selections && \
    dpkg-reconfigure -f noninteractive dash


# docker run --network host -it --name lfs -v `pwd`/docker:/w -w /w --cap-add SYS_ADMIN --security-opt apparmor:unconfined -d ubuntu:focal sleep infinity
