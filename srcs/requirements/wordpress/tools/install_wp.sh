# Install WP-CLI 
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Install and config Wordpres
wp core download --locale=fr_FR
wp core config --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_USER_PSW} --dbhost=${DB_HOST} --dbprefix=${TABLE_PREFIX}
wp core install --url=${DOMAIN} --title=${TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PSW} --admin_email=${WP_ADMIN_EMAIL}
wp user create ${WP_USER} ${WP_USER_EMAIL} --role=subscriber --user_pass=${WP_USER_PSW}

exec php-fpm7 -F