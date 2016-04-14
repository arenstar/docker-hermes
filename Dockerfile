FROM debian:jessie
ENV HERMES_VERSION 1.9

RUN apt-get update && apt-get -y install libssl-dev libspf2-dev make git curl bzip2 g++ pkg-config libsqlite3-dev  && rm -rf /var/lib/apt/lists/*

RUN cd /tmp && curl http://www.hermes-project.com/files/hermes-${HERMES_VERSION}.tar.bz2 | tar -jx

WORKDIR /tmp/hermes-${HERMES_VERSION}

RUN ./configure        \
     --enable-spf      \    
     --enable-openssl  

RUN make && make install

WORKDIR /

RUN mkdir -p /etc/hermes && mkdir -p /var/hermes

COPY hermesrc /etc/hermes/hermesrc

EXPOSE 25

CMD ["hermes","/etc/hermes/hermesrc"]
