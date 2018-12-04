FROM ubuntu:18.04
MAINTAINER EODCrafter

#update and install packages
RUN \
 echo "**** install packages ****" && \
 apt-get update && \
 apt-get install -y \
  sudo \
  unzip \
  man-db \
  apt-utils \
  curl
 
#set workdir and copy .sh
WORKDIR /xteve
COPY run-me.sh /xteve/
COPY xteve /xteve/

#install xteve
RUN echo "**** install xteve ****" && \ 
 chmod +x /xteve/xteve

#make .sh executeble
RUN chmod +x /xteve/run-me.sh

#add volumes
VOLUME /config

ENTRYPOINT ["/xteve/run-me.sh"]

