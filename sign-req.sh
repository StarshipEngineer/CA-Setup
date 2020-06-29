#!/bin/bash

#question- will this need sudo access?

#Accept server credentials passed from the server invoking this script
SERVER_USER=$1 #First argument must be username running the server/clients
SERVER_IP=$2 #Second argument must be local IP address of server/client
REQ_TYPE=$3 #Third argument must be the type of request (server/client)
REQ_NAME=$4 #Fourth argument must be the name of the server/client
EASYRSA=$5 #Fifth argument must be the version of EasyRSA

#Import the request
cd ~/$EASYRSA
./easyrsa import-req /tmp/$REQ_NAME.req $REQ_NAME

#Sign the request
./easyrsa sign-req $REQ_TYPE $REQ_NAME

#Send the signed certificate back to server
scp pki/issued/$REQ_NAME.crt $SERVER_USER@$SERVER_IP:/tmp