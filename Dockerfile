    # Dockerfile
    FROM php:8.2-fpm

    # Laravel-д шаардлагатай extension-үүд
    RUN apt-get update && apt-get install -y \
        zip unzip curl libpng-dev libonig-dev libxml2-dev git \
        && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

    # Composer суулгах
    COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

    WORKDIR /var/www

    # Laravel код хуулахгүй. Docker Compose үед bind хийнэ.
