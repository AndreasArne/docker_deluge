FROM ubuntu:trusty

# Remove red warning text
ENV DEBIAN_FRONTEND "noninteractive"

# install deluge
RUN apt-get update -q && \
    apt-get install -qy software-properties-common && \
    add-apt-repository ppa:deluge-team/ppa && \
    apt-get update -q && \
    apt-get install -qy deluged deluge-console

#RUN apt-get install -qy nano

# mount volumes for config and downloads
VOLUME ["/config", "/torrents"]

# add starrt script
ADD start.sh /start.sh

# daemon port
EXPOSE 58846

# incoming torrents
EXPOSE 58946
EXPOSE 58946/udp

# change UMask
RUN echo "umask 007" >> /root/.profile

# runs start script when starting
CMD ["/start.sh"]
