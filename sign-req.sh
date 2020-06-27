#!/bin/bash

#question- will this need sudo access?

#Accept server credentials passed from the server invoking this script
SERVER_USER=$1 #First argument must be username running the server/clients
SERVER_IP=$2 #Second argument must be local IP address of server/client
REQ_NAME=$3 #Third argument must be the name of the server/client
REQ_TYPE=$4 #Fourth argument must be the type of request (server/client)

#Import the request
cd ~/EasyRSA-3.0.7
./easyrsa import-req /tmp/$REQ_NAME.req $REQ_NAME

#Sign the request
./easyrsa sign-req $REQ_TYPE $REQ_NAME

#Send the signed certificate back to server
scp pki/issued/$REQ_NAME.crt $SERVER_USER@$SERVER_IP:/tmp