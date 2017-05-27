FROM alpine:latest
MAINTAINER Ludovic Logiou <ludovic.logiou@gmail.com>
RUN apk update && apk upgrade
RUN apk add transmission-daemon curl tar
WORKDIR /usr/share/transmission/
RUN curl -O https://raw.githubusercontent.com/ronggang/transmission-web-control/master/release/transmission-control-full.tar.gz && tar -xf transmission-control-full.tar.gz 
ADD settings.json /etc/transmission-daemon/settings.json
ENV TRANSMISSION_DIR /var/lib/transmission
ENV TRANSMISSION_INCOMPLETE /var/lib/transmission/temps
ENV TRANSMISSION_USER transmission
ENV TRANSMISSION_PASSWORD transmission
VOLUME /var/lib/transmission
EXPOSE 9091
CMD exec transmission-daemon -f --no-portmap --log-error --config-dir /etc/transmission-daemon/ --username "$TRANSMISSION_USER" --password "$TRANSMISSION_PASSWORD"  --download-dir "$TRANSMISSION_DIR" --incomplete-dir "$TRANSMISSION_INCOMPLETE" --bind-address-ipv4 "0.0.0.0" --auth
