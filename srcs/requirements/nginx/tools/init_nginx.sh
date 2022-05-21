# Create website folder 
mkdir -p /var/www/html

# Config Nginx file
rm -f /etc/nginx/sites-enabled/default
rm -f /etc/nginx/sites-available/default
mv ./nginx.conf /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/
chown -R www-data /var/www/*
chmod -R 755 /var/www/*

# Get SSL certification
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=69/L=Lyon/O=42/CN=tdayde' -keyout /etc/ssl/certs/${DOMAIN}.key -out /etc/ssl/certs/${DOMAIN}.crt