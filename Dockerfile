FROM php:8.0-fpm

WORKDIR /var/www/html

RUN apt-get update && apt-get install --quiet --yes --no-install-recommends \
	libzip-dev \
	unzip\
	libonig-dev \
	libicu-dev

RUN docker-php-ext-configure pcntl --enable-pcntl \
	&& docker-php-ext-configure pdo_mysql --with-pdo-mysql \
	&& docker-php-ext-configure mbstring --enable-mbstring \
	&& docker-php-ext-configure bcmath --enable-bcmath \
	&& docker-php-ext-install zip \
	pdo \
	pdo_mysql \
	zip \
	mbstring \
	intl \
	bcmath \
	pcntl

RUN pecl install -o -f redis \
	&&  rm -rf /tmp/pear \
	&&  docker-php-ext-enable redis

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN groupadd --gid 1000 appuser \ 
	&& useradd --uid 1000 -g appuser \
	-G www-data,root --shell /bin/bash \
	--create-home appuser

USER appuser
