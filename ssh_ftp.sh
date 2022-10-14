#!/bin/bash

echo "installing ssh"
sleep 1
sudo apt install ssh -y
sleep 2
echo "enable ssh"
sleep 1
sudo systemctl enable ssh

echo "installing vsftpd"
sleep 1

sudo apt install vsftpd -y
sleep 3

echo "Create a new FTP user "
read -p "Enter a username:- " USERNAME
read -p "Enter a Password:- " PASSWORD

sudo useradd -m $USERNAME -p $PASSWORD

sleep 5

sudo ufw allow 20/tcp
sleep 1
sudo ufw allow 21/tcp
sleep 1

echo "Done"
