# PythonRestMessageServer

Simple RESTful message server written in python3

# Installation

Make sure you have python3 and python3-venv installed.
`sudo apt-get install python3 python3-venv`

This script will create a new virtual environment, install requirements and provision the database: 
`./setup.sh`

# Running

`./run.sh`

# Example Http requests
__Creating a simple message__

`curl http://localhost:5000/api/v1.0/create_message/ -H "Content-Type: application/json" -X POST -d '{"username":"natalia", "message": "Hej hej"}'`

__Deleting second message__

`curl http://localhost:5000/api/v1.0/delete_message/2/ -X DELETE`

__Get unread messages__

`curl http://localhost:5000/api/v1.0/get_unread_messages/ -X PUT`

__Get all messages__

`curl http://localhost:5000/api/v1.0/get_messages/ -X PUT`
