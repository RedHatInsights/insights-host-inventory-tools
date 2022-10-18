#!/usr/bin/env bash

echo "Terminating: $0"

cd $INSIGHTS_HOST_DIR
docker-compose -p $INSIGHTS_HOST_DOCKER_PROJECT -f $INSIGHTS_HOST_DOCKER_FILE down
