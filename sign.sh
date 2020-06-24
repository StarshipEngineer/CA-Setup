#!/bin/bash

#Import the request
cd ~/EasyRSA-3.0.7
./easyrsa import-req /tmp/server.req server

#Sign the request
./easyrsa sign-req server server

#Send the signed certificate back to server
scp pki/issued/server.crt sammy@your_server_ip:/tmp #adjust for user specified username and ip address

#Swns ca.crt back to server as well
scp pki/ca.crt sammy@your_server_ip:/tmp #adjust for user specified username and ip address