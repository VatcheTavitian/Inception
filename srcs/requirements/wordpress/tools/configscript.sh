# #!bin/sh

if [ ! -f "/var/www/wp-config.php" ]; then
cat << EOF > /var/www/wp-config.php
<?php
define( 'DB_NAME', '${DB_NAME}' );
define( 'DB_USER', '${DB_USER}' );
define( 'DB_PASSWORD', '$DB_PASS' );
define( 'DB_HOST', '$DB_HOST' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define('FS_METHOD','direct');

$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', '/var/www/' );
}

require_once ABSPATH . 'wp-settings.php';
EOF
fi


#!bin/sh

# if [ ! -f "/var/www/wp-config.php" ]; then
# cat << EOF > /var/www/wp-config.php
# <?php
# define( 'DB_NAME', 'dbname' );
# define( 'DB_USER', 'dbuser' );
# define( 'DB_PASSWORD', 'dbpass' );
# define( 'DB_HOST', 'dbhost' );
# define( 'DB_CHARSET', 'utf8' );
# define( 'DB_COLLATE', '' );
# define('FS_METHOD','direct');

# $table_prefix = 'wp_';
# define( 'WP_DEBUG', false );
# if ( ! defined( 'ABSPATH' ) ) {
#     define( 'ABSPATH', '/var/www/' );
# }

# require_once ABSPATH . 'wp-settings.php';
# EOF
# fi





