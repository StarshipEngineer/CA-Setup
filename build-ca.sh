#!/bin/bash

#For now, enter: EasyRSA-3.0.7
COMMON=$(whiptail --inputbox "Enter the EasyRSA version to obtain from GitHub repo (Ex: EasyRSA-3.0.7)" \
8 78 --title "Setup OpenVPN" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
 whiptail --title "Setup OpenVPN" --infobox "User: $COMMON" 8 78
else
 whiptail --title "Setup OpenVPN" --infobox "Cancelled" 8 78
 exit
fi

#Obtain a common name for the CA, if desired
#EASYRSA=$(whiptail --inputbox "Enter the EasyRSA version to obtain from GitHub repo (Ex: EasyRSA-3.0.7)" \
#8 78 --title "Setup OpenVPN" 3>&1 1>&2 2>&3)
#exitstatus=$?
#if [ $exitstatus = 0 ]; then
# whiptail --title "Setup OpenVPN" --infobox "User: $EASYRSA" 8 78
#else
# whiptail --title "Setup OpenVPN" --infobox "Cancelled" 8 78
# exit
#fi

#Download and extract EasyRSA
wget -P ~/ https://github.com/OpenVPN/easy-rsa/releases/download/v3.0.7/$EASYRSA.tgz #This will break in next version...
cd ~
tar xvf $EASYRSA.tgz

# Setup the CA
cd ~/EasyRSA-3.0.7
cp vars.example vars
#Add automated editing based on the vars-values.txt file

#Build the public key infrastructure
./easyrsa init-pki

#Build the certificate authority and create a password
./easyrsa build-ca