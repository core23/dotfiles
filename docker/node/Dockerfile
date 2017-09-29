FROM node

MAINTAINER Christian Gripp <mail@core23.de>

# yarn
RUN curl -o- -L https://yarnpkg.com/install.sh | bash

# Sass
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    ruby \
    ruby-dev

# Compass
RUN gem install \
    sass:3.4.22 \
    compass

# Gulp
RUN yarn global add gulp-cli

# Directory for sources
WORKDIR /src
