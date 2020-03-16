#!/bin/bash -x

unset REDIS_PORT

if [[ -f "/FIRST_RUN" ]] ; then
	rm -rf /FIRST_RUN
	composer install
	yarn install
	yarn run dev
	rm -rf /app/bootstrap/cache/*
	php artisan key:generate
fi

php artisan serve --port 8000 --host 0.0.0.0