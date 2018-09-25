#!/bin/bash

if [ ! -f "./.env" ]; then
	DIRNAME=`basename "$PWD"`

	echo "Environment file not found."
	echo -n "Enter name of your project: [$DIRNAME] "
	read PROJECT_NAME

	if [ -z $PROJECT_NAME ]; then
		PROJECT_NAME=$DIRNAME
	fi

	echo -n "Enter the title of your site: "
	read PROJECT_TITLE

	echo "PROJECT_NAME=$PROJECT_NAME" > .env
	echo "PROJECT_TITLE=$PROJECT_TITLE" >> .env
fi

echo "Environment set up."
