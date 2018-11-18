#!/bin/bash

docker build --no-cache -t core23/composer                  composer
docker build --no-cache -t core23/composer-require-checker  composer-require-checker
docker build --no-cache -t core23/dephpend                  dephpend
docker build --no-cache -t core23/node                      node
docker build --no-cache -t core23/php-cs-fixer              php-cs-fixer
docker build --no-cache -t core23/phpdoc-to-typehint        phpdoc-to-typehint
docker build --no-cache -t core23/phpstan                   phpstan
docker build --no-cache -t core23/phpunit5                  phpunit5
docker build --no-cache -t core23/phpunit6                  phpunit6
docker build --no-cache -t core23/phpunit7                  phpunit7
docker build --no-cache -t core23/rmt                       rmt
