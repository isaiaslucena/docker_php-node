#!/bin/bash -x

unset REDIS_PORT
source .env

if [[ -f "/FIRST_RUN" ]] ; then
	rm -rf /FIRST_RUN
	composer install
	yarn install
	rm -rf /app/bootstrap/cache/*
	php artisan key:generate
fi

yarn run dev
php artisan serve --port 8000 --host 0.0.0.0