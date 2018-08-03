#!/bin/bash

USER=`id -u`

docker-compose exec --user $USER:www-data phpfpm wp "$@"
