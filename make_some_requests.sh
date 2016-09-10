#!/usr/bin/env bash


echo "Creating 3 simple message"
curl http://localhost:5000/api/v1.0/message/create/ -H "Content-Type: application/json" -X POST -d '{"sender":"sniku", "recipient":"nupek", "message": "Hey hey"}' -v
curl http://localhost:5000/api/v1.0/message/create/ -H "Content-Type: application/json" -X POST -d '{"sender":"nupek", "recipient":"nupek", "message": "Hey hey"}' -v
curl http://localhost:5000/api/v1.0/message/create/ -H "Content-Type: application/json" -X POST -d '{"sender":"sniku", "recipient":"nupek", "message": "Hey hey"}' -v
curl http://localhost:5000/api/v1.0/message/create/ -H "Content-Type: application/json" -X POST -d '{"sender":"sniku", "recipient":"nupek", "message": "Hey hey"}' -v
curl http://localhost:5000/api/v1.0/message/create/ -H "Content-Type: application/json" -X POST -d '{"sender":"sniku", "recipient":"nupek", "message": "Hey hey"}' -v
curl http://localhost:5000/api/v1.0/message/create/ -H "Content-Type: application/json" -X POST -d '{"sender":"sniku", "recipient":"nupek", "message": "Hey hey"}' -v
curl http://localhost:5000/api/v1.0/message/create/ -H "Content-Type: application/json" -X POST -d '{"sender":"sniku", "recipient":"nupek", "message": "Hey hey"}' -v
curl http://localhost:5000/api/v1.0/message/create/ -H "Content-Type: application/json" -X POST -d '{"sender":"sniku", "recipient":"nupek", "message": "Hey hey"}' -v
curl http://localhost:5000/api/v1.0/message/create/ -H "Content-Type: application/json" -X POST -d '{"sender":"sniku", "recipient":"nupek", "message": "Hey hey"}' -v

echo "Deleting second message"
curl http://localhost:5000/api/v1.0/message/delete/2/ -X DELETE  -v

echo "Get unread messages"
curl http://localhost:5000/api/v1.0/messages/unread/ -X PUT  -v


echo "Get all messages in range"
curl http://localhost:5000/api/v1.0/messages/range/3/4/ -X PUT -v

echo "Deleting messages in range"
curl http://localhost:5000/api/v1.0/messages/delete/range/6/7/ -X DELETE  -v

echo "Get all messages"
curl http://localhost:5000/api/v1.0/messages/ -X PUT -v
