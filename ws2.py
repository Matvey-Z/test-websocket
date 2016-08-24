#!/usr/bin/python

from websocket import create_connection
###ws = create_connection("ws://echo.websocket.org/")
ws = create_connection("ws://192.168.0.106/echo")
print "Sending 'Hello, World'..."
ws.send("Hello, World")
print "Sent"
print "Receiving..."
result = ws.recv()
print "Received '%s'" % result
ws.close()
