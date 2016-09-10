#!/usr/bin/env bash

#activate virtualenv
source server_venv/bin/activate

python -c "from src.message_server import app; app.run()"
