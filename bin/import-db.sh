#!/bin/bash

echo "Importing MySQL dump into database."

FILE=$1

if [[ ! -f $FILE ]]; then
	echo "Dump file not found."
	exit 404
fi

# Export .env file into vars.
export $(egrep -v '^#' ./.env | xargs)

HOST=main_db
SIZE=`gzip -l $FILE | sed -n 2p | awk '{ print $2 }'`
zcat < $FILE | pv --size=$SIZE | docker exec -i $HOST mysql -uroot $PROJECT_NAME
echo "Done!"
