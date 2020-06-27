#!/bin/bash

#question- will this need sudo access?

#Accept server credentials passed from the server invoking this script
SERVER_USER=$1 #First argument must be username
SERVER_IP=$2 #Second argument must be local IP address of server

#Send the signed certificate back to server
cd ~/EasyRSA-3.0.7
scp pki/issued/server.crt $SERVER_USER@$SERVER_IP:/tmp #adjust for user specified username and ip address