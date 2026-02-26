FROM wordpress:6.9.1-php8.2-apache

COPY . /tmp/site-content

COPY docker-entrypoint-railway.sh /usr/local/bin/docker-entrypoint-railway.sh
RUN chmod +x /usr/local/bin/docker-entrypoint-railway.sh

ENTRYPOINT ["docker-entrypoint-railway.sh"]
CMD ["apache2-foreground"]