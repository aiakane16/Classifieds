FROM gitpod/workspace-mysql:latest

USER root

RUN apt-get install build-essential curl git python libglib2.0-dev

RUN cd /tmp

# Install depot_tools first (needed for source checkout)
RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
RUN export PATH=/tmp/depot_tools:"$PATH"

# Download v8
RUN fetch v8
RUN cd v8

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



