FROM gitpod/workspace-mysql:latest

USER root

RUN apt-get install build-essential curl git python libglib2.0-dev && \
        cd /tmp && \
        git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git && \
        export PATH=/tmp/depot_tools:"$PATH" && \
        fetch v8 && \
        cd v8

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



