FROM core23/composer

MAINTAINER Christian Gripp <mail@core23.de>

# Get needed requirements
RUN /usr/local/bin/composer global require \
    phpstan/phpstan \
    phpstan/phpstan-doctrine \
    phpstan/phpstan-phpunit \
    jangregor/phpstan-prophecy \
    localheinz/phpstan-rules \
    phpstan/phpstan-strict-rules


VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["phpstan"]
