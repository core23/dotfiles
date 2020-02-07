.PHONY: list
list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$' | xargs

all: php composer composer-require-checker dephpend node infection php-cs-fixer php-cs-fixer phpstan phpunit5 phpunit6 phpunit7 phpunit8 phpunit9 rector rmt

composer: php74
	docker build --no-cache -t local/composer                  docker/composer

composer-require-checker: composer
	docker build --no-cache -t local/composer-require-checker  docker/composer-require-checker

deptrac: composer
	docker build --no-cache -t local/deptrac                   docker/deptrac

dephpend: composer
	docker build --no-cache -t local/dephpend                  docker/dephpend

node:
	docker build --no-cache -t local/node                      docker/node

infection: composer
	docker build --no-cache -t local/infection                 docker/infection

php: php72 php73 php74

php72:
	docker build --no-cache -t local/php72 --build-arg VERSION=7.2 docker/php

php73:
	docker build --no-cache -t local/php73 --build-arg VERSION=7.3 docker/php

php74:
	docker build --no-cache -t local/php74 --build-arg VERSION=7.4 docker/php

php-cs-fixer: composer
	docker build --no-cache -t local/php-cs-fixer              docker/php-cs-fixer

phpstan: composer
	docker build --no-cache -t local/phpstan                   docker/phpstan

phpunit5: composer
	docker build --no-cache -t local/phpunit5 --build-arg VERSION=5 docker/phpunit

phpunit6: composer
	docker build --no-cache -t local/phpunit6 --build-arg VERSION=6 docker/phpunit

phpunit7: composer
	docker build --no-cache -t local/phpunit7 --build-arg VERSION=7 docker/phpunit

phpunit8: composer
	docker build --no-cache -t local/phpunit8 --build-arg VERSION=8 docker/phpunit

phpunit9: composer
	docker build --no-cache -t local/phpunit8 --build-arg VERSION=9 docker/phpunit

rector: composer
	docker build --no-cache -t local/rector                    docker/rector

rmt: composer
	docker build --no-cache -t local/rmt                       docker/rmt
