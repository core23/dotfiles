FROM local/composer

MAINTAINER Christian Gripp <mail@core23.de>

# Get needed requirements
RUN /usr/local/bin/composer global require rector/rector

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["rector"]
