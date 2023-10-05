#!/bin/bash

source ${VENV_PATH}/bin/activate
redbot-setup --instance-name ${INSTANCE_NAME} --data-path /data/redbot-data/ --backend json --no-prompt
