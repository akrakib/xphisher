FROM alpine:latest
LABEL MAINTAINER="https://github.com/akrakib/xphisher"
WORKDIR /xphisher/
ADD . /xphisher
RUN apk add --no-cache bash ncurses curl unzip wget php 
CMD "./xphisher.sh"
