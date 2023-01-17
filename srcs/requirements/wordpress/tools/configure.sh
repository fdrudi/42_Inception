#!/bin/sh

#wait for mariadb, then connect with credentials

while ! mariadb -h$MYSQL_HOSTNAME -u$WP_DB_USER -p$WP_DB_PASSWORD $WP_DB_NAME &>/dev/null;
do
    sleep 3
done

if [ ! -f "/var/www/html/wordpress/index.php" ];
then

	mv /tmp/index.html /var/www/html/wordpress/index.html


	wp core download --allow-root
	wp config create --dbname=$WP_DB_NAME --dbuser=$WP_DB_USER --dbpass=$WP_DB_PASSWORD --dbhost=$MYSQL_HOSTNAME --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
	wp db create --allow-root
	wp core install --url=$DOMAIN_NAME --title="Inception" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --allow-root
	wp theme activate twentytwentythree --allow-root

	# Enable FTP Access plugin
	wp plugin install ftp-access --activate --allow-root
	wp plugin update --all --allow-root

	# Enable Redis Object Cache plugin
	wp plugin install redis-cache --activate --allow-root

	# Configure the plugin with Redis hostname and port
	wp config set object_cache_redis_host $REDIS_HOSTNAME --allow-root
	wp config set object_cache_redis_port $REDIS_PORT --allow-root

	wp plugin update --all --allow-root

	#  # enable redis cache
	# sed -i "40i define( 'WP_REDIS_HOST', '$REDIS_HOSTNAME' );"  wp-config.php
	# sed -i "41i define( 'WP_REDIS_PORT', '$REDIS_PORT' );"      wp-config.php
	# sed -i "42i define( 'WP_REDIS_TIMEOUT', 1 );"               wp-config.php
	# sed -i "43i define( 'WP_REDIS_READ_TIMEOUT', 1 );"          wp-config.php
	# sed -i "44i define( 'WP_REDIS_DATABASE', 0 );\n"            wp-config.php

	# wp plugin install redis-cache --activate --allow-root
	# wp plugin update --all --allow-root

fi

echo "WORDPRESS START STATUS : OK"

/usr/sbin/php-fpm7 -F -R
