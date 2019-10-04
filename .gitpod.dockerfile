FROM gitpod/workspace-mysql:latest

USER root
# Install custom tools, runtime, etc.
RUN apt-get update && apt-get install -y \
        beanstalkd \
        graphviz \
        php7.2-bcmath \
        libv8-dev \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/* \
    && pecl install v8js \
    && echo 'extension=v8js.so' >> /etc/php/7.2/cli/conf.d/20-v8js.ini

USER gitpod
# Apply user-specific settings

# Give back control
USER root



