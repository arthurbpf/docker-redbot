#!/bin/bash
python3.11 -m venv ${VENV_PATH}
source ${VENV_PATH}/bin/activate

python -m pip install -U pip wheel
python -m pip install -U Red-DiscordBot
