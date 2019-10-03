FROM gitpod/workspace-mysql:latest

USER root
# Install custom tools, runtime, etc.
RUN apt-get update && apt-get install -y \
        beanstalkd \
        graphviz \
        php7.2-bcmath \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

RUN composer install && php artisan key:generate
RUN mysql -u root -e "create database laravel";
USER gitpod
# Apply user-specific settings

# Give back control
USER root

