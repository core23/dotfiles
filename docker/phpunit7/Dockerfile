FROM core23/composer

MAINTAINER Christian Gripp <mail@core23.de>

# Get needed requirements
RUN /usr/local/bin/composer global require phpunit/phpunit ^7.0

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["phpunit"]
