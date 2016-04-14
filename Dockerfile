FROM alpine:3.3

RUN apk add --update openssl-dev libspf2-dev sqlite-dev sqlite-libs make git curl g++ automake autoconf

ENV HERMES_VERSION 1.9

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
