ARG VERSION=7.4

FROM php:${VERSION}-cli-alpine

MAINTAINER Christian Gripp <mail@core23.de>

# PHP extensions
RUN apk add --update \
    libpng-dev \
    freetype-dev \
    libjpeg-turbo-dev \
    && docker-php-ext-configure gd \
    && docker-php-ext-install gd

RUN echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini

WORKDIR /app
