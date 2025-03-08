FROM php:8.1-cli-alpine

COPY . /changelogger
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'.PHP_EOL; } else { echo 'Installer corrupt'.PHP_EOL; unlink('composer-setup.php'); exit(1); }" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer --version=2.8.6 \
    && php -r "unlink('composer-setup.php');"
RUN (cd /changelogger && composer install)
RUN ln -s /changelogger/changelogger /usr/local/bin/changelogger \
    && mkdir /app
WORKDIR /app
VOLUME ["/app"]
CMD ["changelogger", "new"]
