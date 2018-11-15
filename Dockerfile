FROM ubuntu:18.04

# First install a bunch of dependencies. This could be trimmed quite a bit:
#  - Some of them are only needed for building the package, and not needed at runtime.
#  - Some of them are nice-to-have and not really necessary.
RUN apt-get update && \
    apt-get install -y \
        autoconf \
        automake \
        build-essential \
        gettext \
        git \
        iproute2 \
        iptables \
        iputils-ping \
        liblz4-dev \
        libproxy-dev \
        libssl-dev \
        libtool \
        libxml2-dev \
        net-tools \
        netcat-openbsd \
        ocproxy \
        procps \
        pkg-config \
        telnet \
        vpnc-scripts && \
    apt-get clean && \
    rm -fr /var/lib/apt/lists/*

# Build the OpenConnect client. (There's no tag for the version that we know works.)
RUN git clone https://github.com/dlenski/openconnect.git /tmp/openconnect && \
    cd /tmp/openconnect && \
    git checkout bfaba1b2ba2777f2495251e3870e5e88b5275fcc && \
    ./autogen.sh && \
    ./configure --with-vpnc-script=/usr/share/vpnc-scripts/vpnc-script --without-gnutls && \
    make install && \
    cd / && \
    rm -fr /tmp/openconnect && \
    ldconfig

ENV GLOBALPROTECT_PORTAL='some.vpn.host.example.com' \
    REMOTEDESKTOP_HOST='host.example.com'

COPY start-vpn /usr/local/sbin/

CMD ["start-vpn"]
USER nobody
