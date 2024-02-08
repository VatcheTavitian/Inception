#!/bin/bash


mkdir /var/www/
mkdir /var/www/html

chown -R 755 /var/www/*;

cd /var/www/html

rm -rf *

wget https://wordpress.org/wordpress-6.4.2.tar.gz 

tar -xzvf wordpress-6.4.2.tar.gz 

rm wordpress-6.4.2.tar.gz

