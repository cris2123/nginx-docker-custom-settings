FROM ubuntu:18.04

LABEL maintainer="Cristhian Bravo"

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    wget \
    build-essential \
    libpcre3 \
    libpcre3-dev \
    zlib1g \
    zlib1g-dev \
    libssl-dev \
    openssl \
    systemd


RUN wget http://nginx.org/download/nginx-1.15.7.tar.gz \
    && tar -xvzf nginx-1.15.7.tar.gz \
    && rm -r nginx-1.15.7.tar.gz

ENV NGINX_PATH "/usr/bin/nginx"
ENV NGINX_CONF "/etc/nginx/nginx.conf"
ENV NGINX_ERROR_LOG "/var/log/nginx/error.log"
ENV NGINX_ACCES_LOG "/var/log/nginx/access.log"
ENV NGINX_PID "/var/run/nginx.pid"

COPY ./setup_nginx.sh .
COPY ./nginx.service ./lib/systemd/system/

RUN /bin/bash ./setup_nginx.sh

EXPOSE 80
### to use systemd, but for containers is not necessary but is good to keep the file

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]

#CMD "/bin/bash"
