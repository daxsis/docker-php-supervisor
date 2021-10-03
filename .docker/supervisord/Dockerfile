FROM php:8.0-fpm

RUN apt-get update \
	&& apt-get install --quiet --yes --no-install-recommends supervisor \
	&& docker-php-ext-configure pcntl --enable-pcntl \
	&& docker-php-ext-install pdo pdo_mysql pcntl

RUN pecl install -o -f redis \
	&&  rm -rf /tmp/pear \
	&&  docker-php-ext-enable redis

RUN apt-get clean \
	&& rm -rf /var/libs/apt/lists/* tmp/* var/tmp/* /usr/share/doc/*

RUN export TERM=xterm

COPY .docker/supervisord/supervisord.conf /etc/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
