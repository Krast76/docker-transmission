FROM alpine:latest
MAINTAINER Ludovic Logiou <ludovic.logiou@gmail.com>
RUN apk update && apk upgrade
RUN apk add transmission-daemon
ENV TRANSMISSION_DIR /var/lib/transmission
ENV TRANSMISSION_INCOMPLETE /var/lib/transmission/temps
ENV TRANSMISSION_USER transmission
ENV TRANSMISSION_PASSWORD transmission

CMD transmission-daemon -f --no-portmap --log-error --username "$TRANSMISSION_USER" --password "$TRANSMISSION_PASSWORD"  --download-dir "$TRANSMISSION_DIR" --incomplete-dir "$TRANSMISSION_INCOMPLETE" --bind-address-ipv4 "0.0.0.0" --auth
