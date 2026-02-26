<?php
define('DB_NAME', $_ENV['MARIADB_DATABASE']);
define('DB_USER', $_ENV['MARIADB_USER']);
define('DB_PASSWORD', $_ENV['MARIADB_PASSWORD']);
define('DB_HOST', $_ENV['MARIADB_HOST']);
define('DB_PORT', $_ENV['MARIADB_PORT']);
$table_prefix = 'wp_';
define('WP_DEBUG', false);

// Limites PHP
ini_set('upload_max_filesize', '1024M');
ini_set('post_max_size', '1024M');
ini_set('memory_limit', '1024M');
?>
