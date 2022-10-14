#!/bin/bash

echo "installing ssh"
sleep 1
sudo apt install -y ssh 
sleep 2
echo "enable ssh"
sleep 1
sudo systemctl enable ssh


sudo apt install ufw
sudo ufw enable
sudo ufw allow 20,21/tcp
sudo ufw allow 5000:10000/tcp 

read -p "Enter a username:- " USERNAME
read -p "Enter a Password:- " PASSWORD

sudo useradd -m $USERNAME -p $PASSWORD

echo "Enter the same password below:-"
sudo passwd $USERNAME
echo "installing proftpd"
sleep 1


sudo apt install proftpd 
sleep 3


echo "Done!!!!!!!!!!!!!!!!!"
