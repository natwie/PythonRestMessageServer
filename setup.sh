#!/usr/bin/env bash


# make sure you have python3-dev and python3-venv


# create virtual environment

pyvenv trioptima_venv

#activate it
source trioptima_venv/bin/activate

# install all the dependencies
pip install -r requirements.txt

# create database
python -c "from src import message_server; message_server.db.create_all()"
