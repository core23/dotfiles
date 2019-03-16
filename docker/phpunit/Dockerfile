FROM core23/composer

MAINTAINER Christian Gripp <mail@core23.de>

ARG VERSION=8.0

# Get needed requirements
RUN /usr/local/bin/composer global require phpunit/phpunit ^${VERSION}

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["phpunit"]
