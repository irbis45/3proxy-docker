FROM ubuntu:latest

ENV PROXY_VER=0.8.11

RUN apt-get -q update &&\
    DEBIAN_FRONTEND=noninteractive && \
    apt-get -qy --force-yes dist-upgrade && \
    apt-get install -y build-essential libevent-dev libssl-dev wget && \
    wget https://github.com/z3APA3A/3proxy/archive/${PROXY_VER}.tar.gz && \
    tar xzfv ${PROXY_VER}.tar.gz -C /tmp && \
    make -C /tmp/3proxy-${PROXY_VER} -f Makefile.Linux && \
    make -C /tmp/3proxy-${PROXY_VER} -f Makefile.Linux install && \
    rm ${PROXY_VER}.tar.gz && \
    ln -sf /dev/stdout /var/log/3proxy.log && \
    apt-get purge -y --auto-remove build-essential wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

# Add config file
ADD ./3proxy.cfg /etc/3proxy/3proxy.cfg
ADD ./.proxyauth /etc/3proxy/.proxyauth

# Ports
EXPOSE 8080 3128

STOPSIGNAL SIGTERM

CMD [ "/usr/local/bin/3proxy", "/etc/3proxy/3proxy.cfg" ]
