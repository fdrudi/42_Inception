#!/bin/bash

if [ ! -d "/home/fdrudi/data" ];
then
	mkdir -p /home/fdrudi/data/wp_files /home/fdrudi/data/wp_db
fi

if [ `cat /etc/hosts | grep fdrudi.42.fr | wc -l` -eq 0 ];
then
	echo "127.0.0.1		fdrudi.42.fr" | sudo tee -a /etc/hosts
fi
