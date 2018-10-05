FROM composer

MAINTAINER Christian Gripp <mail@core23.de>

# Get Composer
ENV COMPOSER_HOME /composer
ENV COMPOSER_ALLOW_SUPERUSER 1

RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
 && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
 && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { echo 'Invalid installer' . PHP_EOL; exit(1); }" \
 && php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer \
 && php -r "unlink('/tmp/composer-setup.php');" \
 && php -r "unlink('/tmp/composer-setup.sig');"

# GD Extension
RUN apk add --update \
    libpng-dev \
    freetype-dev \
    libjpeg-turbo-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

# Get needed requirements
ENV PATH /composer/vendor/bin:$PATH

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["composer"]
