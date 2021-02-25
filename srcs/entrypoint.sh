#!/bin/bash

echo 'starting nginx and fcgiwrap'
nginx
/etc/init.d/fcgiwrap start
echo 'done'

tail -f /var/log/nginx/access.log
