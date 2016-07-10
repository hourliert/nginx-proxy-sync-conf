FROM alpine:3.4

MAINTAINER Thomas Hourlier <thomas.hourlier@cnode.fr>

VOLUME /htpasswd
VOLUME /vhost.d

WORKDIR /config

COPY src/entrypoint.sh .

ENTRYPOINT /config/entrypoint.sh
