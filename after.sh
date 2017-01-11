#!/bin/bash
cd /vagrant
php artisan key:generate
composer install
composer dump-autoload

php artisan migrate:refresh