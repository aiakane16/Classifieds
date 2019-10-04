FROM gitpod/workspace-mysql:latest

USER root

RUN apt-get update -y &&\
    apt-get upgrade -y &&\
    apt-get install software-properties-common &&\
    add-apt-repository -y ppa:ondrej/php && \
    add-apt-repository -y ppa:pinepain/libv8-archived -y && \
    apt-get update -y && \
    apt-get install php7.2 php7.2-curl php7.2-dev php7.2-mbstring php7.2-zip php7.2-mysql && \
    pecl install v8js && \
    echo 'extension=v8js.so' >> /etc/php/7.2/cli/conf.d/20-v8js.ini && \
    php -i | grep v8js

# Install custom tools, runtime, etc.
RUN apt-get install -y \
        beanstalkd \
        graphviz \
        php7.2-bcmath \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

USER gitpod
# Apply user-specific settings

# Give back control
USER root



