#!/bin/bash -x

if [[ -f "/FIRST_RUN" ]] ; then
	rm -rf /FIRST_RUN
	composer install
	npm install
	php artisan key:generate
fi

php artisan serve --port 80 --host 0.0.0.0
