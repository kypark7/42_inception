service mysql start
mysql -e "create database ${DB_NAME};"
mysql -e "create user ${DB_USER}@'%' identified by '${DB_USER_PSW}';"
mysql -e "grant all privileges on ${DB_NAME}.* to '${DB_USER}'@'%'; flush privileges;"
mysql -e "alter user 'root'@'localhost' identified by '${DB_ROOT_PSW}'; flush privileges;"