# Make new image from aline last stable version
FROM alpine:3.14

# Install utils
RUN apk add --update wget curl bash util-linux openrc mysql-client

# Install PHP
RUN apk --update add --no-cache \
		php \
		php-fpm \
		php-iconv \
		php-json \
		php-mysqli \
		php-phar

# Create and moove to work directory
WORKDIR /var/www/html/wordpress

# Exec script for install Wordpress
COPY ./tools/install_wp.sh ./
COPY ./conf/www.conf /etc/php7/php-fpm.d/
RUN chmod 447 ./install_wp.sh
CMD ./install_wp.sh