#!/usr/bin/env bash
set -euo pipefail

SOURCE_DIR="/tmp/site-content"
TARGET_WP_CONTENT="/var/www/html/wp-content"

mkdir -p "$TARGET_WP_CONTENT"

for folder in plugins themes uploads mu-plugins languages; do
  if [ -d "$SOURCE_DIR/$folder" ]; then
    rm -rf "$TARGET_WP_CONTENT/$folder"
    cp -a "$SOURCE_DIR/$folder" "$TARGET_WP_CONTENT/$folder"
  fi
done

for file in advanced-cache.php object-cache.php db.php; do
  if [ -f "$SOURCE_DIR/$file" ]; then
    cp -f "$SOURCE_DIR/$file" "$TARGET_WP_CONTENT/$file"
  fi
done

chown -R www-data:www-data /var/www/html

exec docker-entrypoint.sh "$@"