#!/bin/bash

EASYRSA=$1 #First argument must be the version of EasyRSA (for now, use EasyRSA-3.0.7)

#Download and extract EasyRSA
wget -P ~/ https://github.com/OpenVPN/easy-rsa/releases/download/v3.0.7/$EASYRSA.tgz #This will break in next version...
cd ~
tar xvf $EASYRSA.tgz
rm $EASYRSA.tgz

# Setup the CA
cd ~/$EASYRSA
cp vars.example vars

#Populate the vars defaults for new certificates; edit source file before running script
sed -i '/EASYRSA_REQ_OU/ r vars-values.txt' vars

#Build the public key infrastructure
./easyrsa init-pki

#Build the certificate authority and create a password
./easyrsa build-ca