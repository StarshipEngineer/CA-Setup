#!/bin/bash

#question- will this need sudo access?

#Accept server credentials passed from the server invoking this script
SERVER_USER=$1 #First argument must be username running the server
SERVER_IP=$2 #Second argument must be local IP address of server

#Sends ca.crt back to server
cd ~/EasyRSA-3.0.7
scp pki/ca.crt $SERVER_USER@$SERVER_IP:/tmp