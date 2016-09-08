#!/usr/bin/env bash


echo "Creating 3 simple message"
curl http://localhost:5000/api/v1.0/create_message/ -H "Content-Type: application/json" -X POST -d '{"username":"sniku", "message": "Hey hey"}' -v
curl http://localhost:5000/api/v1.0/create_message/ -H "Content-Type: application/json" -X POST -d '{"username":"nupek", "message": "Mehu"}' -v
curl http://localhost:5000/api/v1.0/create_message/ -H "Content-Type: application/json" -X POST -d '{"username":"sniku", "message": "Jaha"}' -v

echo "Deleting second message"
curl http://localhost:5000/api/v1.0/delete_message/2/ -X DELETE  -v

echo "Get all messages"
curl http://localhost:5000/api/v1.0/get_messages/  -v
