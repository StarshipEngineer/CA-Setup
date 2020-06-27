#!/bin/bash

#question- will this need sudo access?

#Accept server credentials passed from the server invoking this script
SERVER_USER=$1 #First argument must be username running the server
SERVER_IP=$2 #Second argument must be local IP address of server

#Import the request
cd ~/EasyRSA-3.0.7
./easyrsa import-req /tmp/server.req server

#Sign the request
./easyrsa sign-req server server

#Send the signed certificate back to server
scp pki/issued/server.crt $SERVER_USER@$SERVER_IP:/tmp #adjust for user specified username and ip address

#Sends ca.crt back to server as well
scp pki/ca.crt $SERVER_USER@$SERVER_IP:/tmp #adjust for user specified username and ip address