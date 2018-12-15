#!/bin/bash

## Need to source the env_variables files to get the variables available inside this
## process

source ./env_variables.sh

cd nginx-1.15.7
./configure --sbin-path=$NGINX_PATH --conf-path=$NGINX_CONF \
--error-log-path=$NGINX_ERROR_LOG --http-log-path=$NGINX_ACCES_LOG \
--with-pcre --pid-path=$NGINX_PID --with-http_ssl_module
make
make install

exit 0
