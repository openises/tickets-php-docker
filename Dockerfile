FROM php:7.4.30-apache

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# Already installed in docker-php-apache:
# curl mbstring pdo xml

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions bz2 calendar exif ffi gd gettext gmp intl mcrypt mysqli pdo_mysql shmop sockets sysvmsg sysvsem sysvshm xmlrpc xsl zip

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"