# Make new image from debian buster version
FROM debian:buster

# Update apt
RUN apt-get update \
&& apt-get upgrade -y

# Define ARGS
ARG DOMAIN

# Install NGINX
RUN apt-get -y install nginx

# Install OpenSSL
RUN apt-get -y install openssl

# Open https port
EXPOSE 443

COPY ./conf/nginx.conf .
COPY ./tools/init_nginx.sh .
RUN chmod 447 ./init_nginx.sh
RUN ./init_nginx.sh

# Start Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]