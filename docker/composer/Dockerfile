FROM php:7.4-alpine

MAINTAINER Christian Gripp <mail@core23.de>

# PHP extensions
RUN apk add --update \
    libpng-dev \
    freetype-dev \
    libjpeg-turbo-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

# Get Composer
COPY --from=composer /usr/bin/composer /usr/local/bin/composer

ENV COMPOSER_ALLOW_SUPERUSER 1

ENV PATH /root/.composer/vendor/bin:$PATH

ENTRYPOINT ["composer"]
