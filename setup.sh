#!/bin/bash

#Download and extract EasyRSA
#Feature: build in a way to specify Easy-RSA download link, and automate the tarball extraction
wget -P ~/ https://github.com/OpenVPN/easy-rsa/releases/download/v3.0.7/EasyRSA-3.0.7.tgz
cd ~
tar xvf EasyRSA-v3.0.7.tgz

# Setup the CA
cd ~/EasyRSA-3.0.7
cp vars.example vars
#Add automated editing based on the vars-values.txt file

#Build the public key infrastructure
./easyrsa init-pki

#Build the certificate authority and create a password
./easyrsa build-ca


#Server and all clients will need a copy of ca.crt file
#ONLY the CA machine should have the ca.key file