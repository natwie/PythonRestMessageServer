#!/usr/bin/env bash


echo "Creating messages"
curl http://localhost:5000/api/v1.0/message/create/ -H "Content-Type: application/json" -X POST -d '{"sender":"natalia", "recipient":"tomas", "message": "Hey hey"}' -v
curl http://localhost:5000/api/v1.0/message/create/ -H "Content-Type: application/json" -X POST -d '{"sender":"natalia", "recipient":"jonas", "message": "Hej!"}' -v
curl http://localhost:5000/api/v1.0/message/create/ -H "Content-Type: application/json" -X POST -d '{"sender":"natalia", "recipient":"martin", "message": "Hello"}' -v
curl http://localhost:5000/api/v1.0/message/create/ -H "Content-Type: application/json" -X POST -d '{"sender":"martin", "recipient":"natalia", "message": "Time to code something"}' -v
curl http://localhost:5000/api/v1.0/message/create/ -H "Content-Type: application/json" -X POST -d '{"sender":"maria", "recipient":"natalia", "message": "Python rocks!"}' -v
curl http://localhost:5000/api/v1.0/message/create/ -H "Content-Type: application/json" -X POST -d '{"sender":"natalia", "recipient":"maria", "message": "Java rocks too"}' -v
curl http://localhost:5000/api/v1.0/message/create/ -H "Content-Type: application/json" -X POST -d '{"sender":"natalia", "recipient":"martin", "message": "Hej"}' -v
curl http://localhost:5000/api/v1.0/message/create/ -H "Content-Type: application/json" -X POST -d '{"sender":"martin", "recipient":"natalia", "message": "Hi!"}' -v
curl http://localhost:5000/api/v1.0/message/create/ -H "Content-Type: application/json" -X POST -d '{"sender":"natalia", "recipient":"maria", "message": "New commit"}' -v

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
