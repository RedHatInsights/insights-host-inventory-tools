#!/usr/bin/env bash

source functions.sh

echo "Starting: $0"

cd $XJOIN_DIR
wait_for_docker_services $XJOIN_DOCKER_FILE "$XJOIN_DOCKER_SERVICES"
sleep 15
npm run seed
npm start
