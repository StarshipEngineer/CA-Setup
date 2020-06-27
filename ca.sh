#!/bin/bash

#For now, enter: EasyRSA-3.0.7
EASYRSA=$(whiptail --inputbox "Enter the EasyRSA version to obtain from GitHub repo (Ex: EasyRSA-3.0.7)" \
8 78 --title "Setup OpenVPN" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
 whiptail --title "Setup OpenVPN" --infobox "User: $EASYRSA" 8 78
else
 whiptail --title "Setup OpenVPN" --infobox "Cancelled" 8 78
 exit
fi

#Obtain a common name for the CA, if desired
CA_NAME=$(whiptail --inputbox "Enter the EasyRSA version to obtain from GitHub repo (Ex: EasyRSA-3.0.7)" \
8 78 --title "Setup OpenVPN" 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus = 0 ]; then
whiptail --title "Setup OpenVPN" --infobox "User: $CA_NAME" 8 78
else
whiptail --title "Setup OpenVPN" --infobox "Cancelled" 8 78
exit
fi