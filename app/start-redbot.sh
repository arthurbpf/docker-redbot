#!/bin/bash

source ${VENV_PATH}/bin/activate
redbot ${INSTANCE_NAME} --token ${TOKEN} --prefix ${PREFIX}
