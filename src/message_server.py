#!/usr/bin/env python3

from datetime import datetime

from flask import Flask, jsonify, request, abort
from flask_sqlalchemy import SQLAlchemy
from .validators import json_params_exist

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///../database.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)


class Message(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    sender = db.Column(db.String(80), unique=False)
    recipient = db.Column(db.String(80), unique=False)
    message = db.Column(db.Text(), unique=False)
    created_date = db.Column(db.DateTime(), unique=False)
    is_read = db.Column(db.Boolean, unique=False, default=False)

    def __init__(self, sender, recipient, message):
        self.sender = sender
        self.recipient = recipient
        self.message = message
        self.created_date = datetime.utcnow()
        self.is_read = False

    def serialize(self):
        return {
            'id': self.id,
            'sender': self.sender,
            'recipient': self.recipient,
            'message': self.message,
            'created_date': self.created_date,
            'is_read':self.is_read,
        }

    def __repr__(self):
        return '<Message {0} {1} {2}>'.format(self.sender, self.recipient, self.message)


@app.route("/api/v1.0/message/create/", methods=['POST'])
def crete_message():
    valid, message = json_params_exist(request, ['sender', 'recipient', 'message'])
    if not valid:
        abort(400, {'message': message})

    m = Message(request.json['sender'], request.json['recipient'], request.json['message'])
    db.session.add(m)
    db.session.commit()

    return jsonify({"created": True, 'id': m.id})


@app.route("/api/v1.0/message/delete/<int:id>/", methods=['DELETE'])
def delete_message(id):
    m = Message.query.filter_by(id=id).first()
    if m:
        db.session.delete(m)
        db.session.commit()
        return jsonify({"deleted": True})

    abort(404, "Message with id {} doesn't exist.".format(id))


@app.route("/api/v1.0/messages/delete/range/<int:start>/<int:end>/", methods=['DELETE'])
def delete_messages_in_range(start, end):
    messages = db.session.query(Message).filter(Message.id >= start)\
                                        .filter(Message.id <= end)\
                                        .delete()
    db.session.commit()
    return jsonify({"deleted": messages})


@app.route("/api/v1.0/messages/", methods=['PUT'])
def get_messages():
    messages = Message.query.all()
    db.session.query(Message).update({Message.is_read: True})
    db.session.commit()

    return jsonify(messages=[m.serialize() for m in messages])


@app.route("/api/v1.0/messages/range/<int:start>/<int:end>/", methods=['PUT'])
def get_messages_in_range(start, end):
    messages = Message.query.filter(Message.id >= start)\
                            .filter(Message.id <= end)\
                            .order_by(Message.created_date)

    Message.query.filter(Message.id >= start) \
                 .filter(Message.id <= end) \
                 .update({Message.is_read: True})

    db.session.commit()

    return jsonify(messages=[m.serialize() for m in messages])


@app.route("/api/v1.0/messages/unread/", methods=['PUT'])
def get_unread_messages():
    messages = db.session.query(Message).filter(Message.is_read == False)
    underad_messages = [m.serialize() for m in messages]
    messages.update({Message.is_read: True})
    db.session.commit()

    return jsonify(messages=underad_messages)
