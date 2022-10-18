#!/usr/bin/env bash

source functions.sh

echo "Starting: $0"

cd $INSIGHTS_HOST_DIR
wait_for_docker_services $INSIGHTS_HOST_DOCKER_FILE "$INSIGHTS_HOST_DOCKER_SERVICES"
sleep 15
pipenv run make run_inv_mq_service
