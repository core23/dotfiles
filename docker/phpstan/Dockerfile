FROM local/composer

MAINTAINER Christian Gripp <mail@core23.de>

# Get needed requirements
RUN /usr/local/bin/composer global require \
#    ekino/phpstan-banned-code \
    phpstan/extension-installer \
    phpstan/phpstan \
    phpstan/phpstan-doctrine \
    phpstan/phpstan-phpunit \
    phpstan/phpstan-strict-rules \
    phpstan/phpstan-symfony \
    jangregor/phpstan-prophecy \
    ergebnis/phpstan-rules \
    phpstan/phpstan-strict-rules

ENTRYPOINT ["phpstan"]
