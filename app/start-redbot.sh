#!/bin/bash

echo ${VENV_PATH}
echo ${INSTANCE_NAME}
echo ${TOKEN}
echo ${PREFIX}

source ${VENV_PATH}/bin/activate
redbot ${INSTANCE_NAME} --token ${TOKEN} --prefix ${PREFIX}
