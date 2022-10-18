#!/usr/bin/env bash

source functions.sh

echo "Starting: $0"

cd $INSIGHTS_HOST_DIR
# wait for xjoin
sleep 20
pipenv run make run_inv_web_service
