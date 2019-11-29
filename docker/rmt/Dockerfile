FROM local/composer

MAINTAINER Christian Gripp <mail@core23.de>

# Get needed requirements
RUN /usr/local/bin/composer global require --no-update liip/rmt && \
    /usr/local/bin/composer global require --no-update phpunit/phpunit ^7.0 && \
    /usr/local/bin/composer global update

ENTRYPOINT ["RMT"]
