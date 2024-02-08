#!/bin/sh

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out $CERTIFICATE_PATH -subj $VALUE_

echo "SSL CERTIFICATE GENERATED - default file configuration complete"

echo "Launching NGINX"

