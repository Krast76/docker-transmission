FROM alpine:latest
MAINTAINER Ludovic Logiou <ludovic.logiou@gmail.com>
RUN apk update && apk upgrade
RUN apk add transmission-daemon
ENV TRANSMISSION_DIR /var/lib/transmission
ENV TRANSMISSION_INCOMPLETE /var/lib/transmission/temps
ENV TRANSMISSION_USER transmission
ENV TRANSMISSION_PASSWORD transmission
