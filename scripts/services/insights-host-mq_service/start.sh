#!/usr/bin/env bash

source functions.sh

echo "Starting: $0"

cd $INSIGHTS_HOST_DIR
# Wait for database and kafka
wait_for_ports $DB_PORT $KAFKA_PORT
sleep 10 # Give Kafka a chance to be ready.
pipenv run make run_inv_mq_service
