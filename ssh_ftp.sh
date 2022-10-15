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
sudo ufw allow 20,21,22/tcp
sudo ufw allow 5000:10000/tcp


echo "Enter password:- superman"
sleep 4
sudo adduser shark

echo "AllowUsers shark" | sudo tee -a /etc/ssh/sshd_config


echo "installing proftpd"
sleep 1


sudo apt install proftpd

sleep 4
echo "DefaultRoot ~" | sudo tee -a /etc/proftpd/proftpd.conf
echo "User shark" | sudo tee -a /etc/proftpd/proftpd.conf
echo "Group shark" | sudo tee -a /etc/proftpd/proftpd.conf



sudo systemctl restart ssh.service
sleep 3
sudo systemctl restart proftpd.service

echo "Done!!!!!!!!!!!!!!!!!"
