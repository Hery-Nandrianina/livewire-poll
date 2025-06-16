FROM richarvey/nginx-php-fpm:3.1.6

# Set working directory
WORKDIR /var/www/html

# Copy app files
COPY . .

# Let Composer run during build
ENV SKIP_COMPOSER 0
ENV COMPOSER_ALLOW_SUPERUSER 1

# Laravel + PHP config
ENV WEBROOT /var/www/html/public
ENV PHP_ERRORS_STDERR 1
ENV RUN_SCRIPTS 1
ENV REAL_IP_HEADER 1

ENV APP_ENV production
ENV APP_DEBUG false
ENV LOG_CHANNEL stderr

# Pre-install Livewire
RUN composer require livewire/livewire --no-interaction --no-dev

# Set default command
CMD ["/start.sh"]
