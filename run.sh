#!/bin/bash -x

unset REDIS_PORT
rm -rf /app/bootstrap/cache/*
source .env

if [[ -f "/FIRST_RUN" ]] ; then
	rm -rf /FIRST_RUN
	composer install
	yarn install
	php artisan key:generate
fi

yarn run dev

php artisan optimize:clear
php artisan serve --port 8000 --host 0.0.0.0