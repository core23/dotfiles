FROM core23/composer

MAINTAINER Christian Gripp <mail@core23.de>

# Get needed requirements
RUN /usr/local/bin/composer global require friendsofphp/php-cs-fixer sllh/php-cs-fixer-styleci-bridge

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["php-cs-fixer"]
