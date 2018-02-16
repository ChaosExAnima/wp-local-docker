#!/bin/bash

echo "Importing MySQL dump into database."

HOST=main_db
FILE=$1

if [[ ! -f $FILE ]]; then
	echo "Dump file not found."
	exit 404
fi

SIZE=`gzip -l $FILE | sed -n 2p | awk '{ print $2 }'`
zcat < $FILE | pv --size=$SIZE | docker exec -i $HOST mysql -uroot -ppassword wordpress
echo "Done!"

