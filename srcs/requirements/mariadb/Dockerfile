# Make new image from debian buster version
FROM debian:buster

# Define ARGS
ARG DB_NAME
ARG DB_ROOT_PSW
ARG DB_USER
ARG DB_USER_PSW

# Update apt
RUN apt update \
&& apt upgrade -y

# Install MySQL
RUN apt -y install mariadb-server
RUN sed -i 's/bind-address/bind-address = 0.0.0.0 #/i' /etc/mysql/mariadb.conf.d/50-server.cnf

# Exec script for create database + user
COPY ./tools/init_db.sh ./
RUN chmod 755 ./init_db.sh
RUN ./init_db.sh

# Start Mysql in foreground
CMD /usr/bin/mysqld_safe