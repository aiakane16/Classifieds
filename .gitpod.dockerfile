FROM gitpod/workspace-mysql:latest

USER root

ENV TAR_OPTIONS=--no-same-owner

RUN apt-get upgrade && apt-get update && apt-get install -y \
        beanstalkd \
        graphviz \
        php7.2-bcmath \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

#RUN cd /tmp && \
#    git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git && \
#    export PATH=`pwd`/depot_tools:"$PATH" && \
#    fetch v8  && \
#    cd v8 && \
#    gclient sync && \
#    tools/dev/v8gen.py -vv x64.release -- is_component_build=true use_custom_libcxx=false && \
#    ninja -C out.gn/x64.release/ && \
#    sudo mkdir -p /opt/v8/{lib,include} && \
#    sudo cp out.gn/x64.release/lib*.so out.gn/x64.release/*_blob.bin \
#        out.gn/x64.release/icudtl.dat /opt/v8/lib/ && \
#    sudo cp -R include/* /opt/v8/include/ && \
#    cd /tmp && \
#    git clone https://github.com/phpv8/v8js.git && \
#    cd v8js && \
#    phpize  && \
#    ./configure --with-v8js=/opt/v8 LDFLAGS="-lstdc++"  && \
#    make  && \
#    make test  && \
#    sudo make install

USER gitpod
# Apply user-specific settings

# Give back control
USER root



