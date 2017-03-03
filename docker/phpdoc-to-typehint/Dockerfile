FROM core23/composer

MAINTAINER Christian Gripp <mail@core23.de>

# Get needed requirements
RUN /usr/local/bin/composer global init -s dev
RUN /usr/local/bin/composer global require dunglas/phpdoc-to-typehint

# Get needed requirements
ENV PATH /composer/vendor/dunglas/phpdoc-to-typehint/bin:$PATH

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["phpdoc-to-typehint"]
