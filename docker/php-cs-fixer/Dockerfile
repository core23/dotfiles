FROM local/composer

MAINTAINER Christian Gripp <mail@core23.de>

# Get needed requirements
RUN /usr/local/bin/composer global require friendsofphp/php-cs-fixer kubawerlos/php-cs-fixer-custom-fixers

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["php-cs-fixer"]
