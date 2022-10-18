#!/usr/bin/env bash

echo "Terminating: $0"

cd $XJOIN_DIR
docker-compose -p $ELASTICSEARCH_DOCKER_PROJECT -f $ELASTICSEARCH_DOCKER_FILE down
