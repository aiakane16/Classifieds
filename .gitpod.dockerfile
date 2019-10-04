FROM gitpod/workspace-mysql:latest

USER root

RUN apt update &&\
    apt upgrade &&\
    apt-get install python-software-propertiesadd-apt-repository -y ppa:ondrej/php && \
    add-apt-repository -y ppa:pinepain/libv8-archived && \
    apt update && \
    apt-get install php7.2 php7.2-curl php7.2-dev php7.2-mbstring php7.2-zip php7.2-mysql libv8-dev

RUN pecl install v8js && \
    echo 'extension=v8js.so' >> /etc/php/7.2/cli/conf.d/20-v8js.ini && \
    php -i | grep v8js

# Install custom tools, runtime, etc.
RUN apt-get install -y \
        python-software-properties \
        beanstalkd \
        graphviz \
        php7.2-bcmath \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

USER gitpod
# Apply user-specific settings

# Give back control
USER root



