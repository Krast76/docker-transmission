FROM alpine:latest
WORKDIR /opt
RUN apk update && \
    apk upgrade && \
    apk add curl tar
RUN curl -O https://raw.githubusercontent.com/ronggang/transmission-web-control/master/release/transmission-control-full.tar.gz && tar -xf transmission-control-full.tar.gz 



FROM alpine:latest
MAINTAINER Ludovic Logiou <ludovic.logiou@gmail.com>
RUN apk update && \ 
    apk upgrade && \
    apk add transmission-daemon
COPY --from=0 /opt/* /usr/share/transmission/
VOLUME /var/lib/transmission
EXPOSE 9091
CMD exec transmission-daemon -f --no-portmap --log-error --config-dir /etc/transmission-daemon/ --username "$TRANSMISSION_USER" --password "$TRANSMISSION_PASSWORD"  --download-dir "$TRANSMISSION_DIR" --incomplete-dir "$TRANSMISSION_INCOMPLETE" --bind-address-ipv4 "0.0.0.0" --auth
