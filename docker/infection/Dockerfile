FROM local/phpunit8

MAINTAINER Christian Gripp <mail@core23.de>

# Get needed requirements
RUN /usr/local/bin/composer global require \
    infection/infection

ENTRYPOINT ["infection"]
