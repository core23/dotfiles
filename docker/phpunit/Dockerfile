FROM local/composer

MAINTAINER Christian Gripp <mail@core23.de>

ARG VERSION=9
ARG XDEBUG_PORT=9021

RUN  apk add --update --virtual build_deps gcc g++ autoconf make \
  && docker-php-source extract \
  && pecl install xdebug \
  && docker-php-ext-enable xdebug \
  && echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
  && echo "xdebug.remote_autostart=0" >> /usr/local/etc/php/conf.d/xdebug.ini \
  && echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
  && echo "xdebug.remote_handler = dbgp" >> /usr/local/etc/php/conf.d/xdebug.ini \
  && echo "xdebug.remote_mode = req" >> /usr/local/etc/php/conf.d/xdebug.ini \
  && echo "xdebug.remote_host=${XDEBUG_HOST}" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
  && echo "xdebug.remote_port=${XDEBUG_PORT}" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
  && echo "xdebug.profiler_enable=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
  && docker-php-source delete \
  && apk del build_deps \
  && rm -rf /var/cache/apk/* \
  && rm -rf /tmp/*

# Get needed requirements
RUN /usr/local/bin/composer global require phpunit/phpunit ^${VERSION}

ENTRYPOINT ["phpunit"]
