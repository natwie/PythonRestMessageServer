# PythonRestMessageServer

Simple RESTful message server written in python3

# Installation

Make sure you have python3 and python3-venv installed.
`sudo apt-get install python3 python3-venv`

This script will create a new virtual environment, install requirements and provision the database: 
`./setup.sh`

# Running

`./run.sh`

# Ready requests are available in file make_some_requests.sh

# Example Http requests
__Creating a simple message__

`curl http://localhost:5000/api/v1.0/message/create/ -H "Content-Type: application/json" -X POST -d '{"sender":"natalia", "recipient":"tomas", "message": "Hey hey"}'`

__Deleting second message__

`curl http://localhost:5000/api/v1.0/message/delete/2/ -X DELETE`

__Get unread messages__

`curl http://localhost:5000/api/v1.0/messages/unread/ -X PUT`

__Get all messages__

`curl http://localhost:5000/api/v1.0/messages/ -X PUT`

__Get messags in range, sorted by time__
`curl http://localhost:5000/api/v1.0/messages/range/3/4/ -X PUT`

__Delete messages in rang__
`curl http://localhost:5000/api/v1.0/messages/delete/range/6/7/ -X DELETE`
