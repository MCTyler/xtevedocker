FROM eodcrafter:xteve
MAINTAINER EODCrafter

# Add xteve binary
ADD https://xteve.de:9443/download/?os=linux&arch=amd64&name=xteve&beta=false /xteve/xteve

# Set executable permissions
RUN chmod +x /xteve/xteve

# Volumes
VOLUME /root/xteve
VOLUME /tmp/xteve

# Expose Ports for Access
EXPOSE 34400

# TODO: Healthcheck

# Entrypoint should be the base command
ENTRYPOINT ["/xteve/xteve"]

# Command should be the basic working
CMD ["-port=34400"]
