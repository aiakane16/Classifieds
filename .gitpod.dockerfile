FROM gitpod/workspace-mysql:latest

USER root

RUN apt update && \
    apt upgrade && \
    apt-get install build-essential curl git python libglib2.0-dev && \
    cd /tmp && \
    git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git && \
    export PATH=`pwd`/depot_tools:"$PATH" && \
    fetch v8 && \
    cd v8 && \
    git checkout 6.4.388.18 && \
    gclient sync && \
    tools/dev/v8gen.py -vv x64.release -- is_component_build=true use_custom_libcxx=false && \
    ninja -C out.gn/x64.release/ && \
    sudo mkdir -p /opt/v8/{lib,include} && \
    sudo cp out.gn/x64.release/lib*.so out.gn/x64.release/*_blob.bin \
    out.gn/x64.release/icudtl.dat /opt/v8/lib/ && \
    sudo cp -R include/* /opt/v8/include/

RUN cd /usr/local/src && \
    git clone https://github.com/phpv8/v8js.git  && \
    cd v8js  && \
    phpize  && \
    ./configure --with-v8js=/opt/v8 LDFLAGS="-lstdc++"  && \
    make -B  && \
    make test  && \
    sudo make install

RUN apt update &&\
    apt upgrade &&\
    apt-get install python-software-propertiesadd-apt-repository -y ppa:ondrej/php && \
    add-apt-repository -y ppa:pinepain/libv8-archived && \
    apt update && \
    apt-get install php7.2 php7.2-curl php7.2-dev php7.2-mbstring php7.2-zip php7.2-mysql

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



