FROM alpine:latest
MAINTAINER Ludovic Logiou <ludovic.logiou@gmail.com>
RUN apk update && apk upgrade
RUN apk add transmission-daemon
