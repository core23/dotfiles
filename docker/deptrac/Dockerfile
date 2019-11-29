FROM local/composer

MAINTAINER Christian Gripp <mail@core23.de>

# Get needed requirements
RUN /usr/local/bin/composer global require sensiolabs-de/deptrac-shim

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["deptrac"]
