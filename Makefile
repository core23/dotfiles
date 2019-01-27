.PHONY: list
list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$' | xargs

all: composer composer-require-checker dephpend node php-cs-fixer php-cs-fixer phpdoc-to-typehint phpstan phpunit5 phpunit6 phpunit7 rmt

composer:
	docker build --no-cache -t core23/composer                  docker/composer

composer-require-checker:
	docker build --no-cache -t core23/composer-require-checker  docker/composer-require-checker

dephpend:
	docker build --no-cache -t core23/dephpend                  docker/dephpend

node:
	docker build --no-cache -t core23/node                      docker/node

php-cs-fixer:
	docker build --no-cache -t core23/php-cs-fixer              docker/php-cs-fixer

phpdoc-to-typehint:
	docker build --no-cache -t core23/phpdoc-to-typehint        docker/phpdoc-to-typehint

phpstan:
	docker build --no-cache -t core23/phpstan                   docker/phpstan

phpunit5:
	docker build --no-cache -t core23/phpunit5                  docker/phpunit5

phpunit6:
	docker build --no-cache -t core23/phpunit6                  docker/phpunit6

phpunit7:
	docker build --no-cache -t core23/phpunit7                  docker/phpunit7

rmt:
	docker build --no-cache -t core23/rmt                       docker/rmt