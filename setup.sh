#!/usr/bin/env bash


# make sure you have python3-dev and python3-venv


# create virtual environment

pyvenv server_venv

#activate it
source server_venv/bin/activate

# install all the dependencies
pip install -r requirements.txt

# create database
python -c "from src import message_server; message_server.db.create_all()"
