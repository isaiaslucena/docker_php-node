#!/bin/bash -x

if [[ "${FIRST_RUN}" == "**TRUE**" ]] ; then
	composer install
	npm install bower-npm-resolver
	npm install
	/app/node_modules/bower/bin/bower --allow-root install
	/app/node_modules/gulp/bin/gulp.js build
	unset FIRST_RUN
	php artisan key:generate
fi

php artisan serve --port 80 --host 0.0.0.0
