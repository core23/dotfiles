FROM node:alpine

MAINTAINER Christian Gripp <mail@core23.de>

# Tools
RUN apk add yarn

# Yarn
RUN yarn global add -g sass \ 
	gulp-cli

# Directory for sources
WORKDIR /src
