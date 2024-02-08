#!/bin/sh

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out $CERTIFICATE -subj "/C=AM/L=YVN/O=42YVN/OU=42/CN=vtavitia.42.fr"

echo "SSL CERTIFICATE GENERATED - default file configuration complete"

echo "Launching NGINX"

