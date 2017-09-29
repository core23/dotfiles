FROM core23/composer

MAINTAINER Christian Gripp <mail@core23.de>

# Get needed requirements
RUN /usr/local/bin/composer global require liip/rmt

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["RMT"]
