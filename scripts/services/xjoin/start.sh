#!/usr/bin/env bash

source functions.sh

echo "Starting: $0"

cd $XJOIN_DIR
# wait for elasticsearch
wait_for_elasticsearch
npm run seed
npm start
