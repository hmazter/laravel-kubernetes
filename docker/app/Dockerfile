# Asset build stage
FROM node:carbon

WORKDIR /application
ADD . .

# install yarn dependencies and build assets
RUN yarn && yarn prod

# Production image
FROM php:7.2-fpm-alpine

LABEL maintainer="krihog@gmail.com"

# Clear alpine cache
RUN rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

#  Linux packages
RUN apk update && apk add \
    zip \
    zlib-dev

# PHP Extensions
RUN docker-php-ext-install zip pdo pdo_mysql

# Download Composer
RUN curl -fSL https://getcomposer.org/composer.phar -o /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer

ADD docker/app/run.sh /run.sh
RUN chmod +x /run.sh

# Add application
ADD . /application

WORKDIR /application

# Add environment variables for production
# ADD .env.production .env

# include all static assets built with webpack/laravel-mix
COPY --from=0 /application/public /application/public

# Install only prod dependencies
RUN composer install --prefer-dist --no-interaction --no-dev

# Set www-data as owner of application storage folder
RUN chown www-data:www-data -R /application/storage

# Cache config and routes
RUN php artisan config:cache
RUN php artisan route:cache


CMD ["/run.sh"]