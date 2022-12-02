#!/bin/bash
/usr/sbin/nginx
while :
	do
		sleep 60
                date +%d-%m-%y--%H:%M > /var/www/html/index.html
	done
