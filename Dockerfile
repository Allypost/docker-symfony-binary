FROM php:fpm-alpine

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN set -ex \
    && apk update \
    && apk --no-cache add wget git bash

RUN wget https://get.symfony.com/cli/installer -O - | bash \
    && mv /root/.symfony/bin/symfony /usr/local/bin/symfony

ENTRYPOINT ["symfony"]
CMD ["--help"]

