FROM richarvey/nginx-php-fpm:3.1.6

USER root

# Install unzip and git, which Composer often needs
RUN apk add --no-cache git unzip

WORKDIR /var/www/html

COPY . .

ENV SKIP_COMPOSER 0
ENV COMPOSER_ALLOW_SUPERUSER 1

ENV WEBROOT /var/www/html/public
ENV PHP_ERRORS_STDERR 1
ENV RUN_SCRIPTS 1
ENV REAL_IP_HEADER 1

ENV APP_ENV production
ENV APP_DEBUG false
ENV LOG_CHANNEL stderr

# Now this will work
RUN composer require livewire/livewire --no-interaction --no-dev

CMD ["/start.sh"]
