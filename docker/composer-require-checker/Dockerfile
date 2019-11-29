FROM local/composer

MAINTAINER Christian Gripp <mail@core23.de>

# Get needed requirements
RUN /usr/local/bin/composer global require maglnet/composer-require-checker:@dev

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["composer-require-checker"]
