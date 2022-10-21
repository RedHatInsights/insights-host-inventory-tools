#!/usr/bin/env bash

source functions.sh

echo "Starting: $0"

cd $INSIGHTS_HOST_DIR
# wait for xjoin
wait_for_ports $XJOIN_PORT
pipenv run make run_inv_web_service
