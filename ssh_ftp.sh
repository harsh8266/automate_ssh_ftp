#!/bin/bash

echo " run with sudo -i "
sleep 6
if [ $USER == 'root' ]; then
echo "installing ssh"
sleep 1
apt install -y ssh 
sleep 2
echo "enable ssh"
sleep 1
systemctl enable ssh

echo "installing vsftpd"
sleep 1

apt install -y vsftpd 
sleep 3

echo "Create a new FTP user "
read -p "Enter a username:- " USERNAME
read -p "Enter a Password:- " PASSWORD

useradd -m $USERNAME -p $PASSWORD

sleep 5


systemctl enable vsftpd
apt install ufw
ufw enable
ufw allow 20,21,990/tcp
echo "$USERNAME" | sudo tee -a /etc/vsftpd.userlist
cd /home/$USERNAME
mkdir ftp
mkdir ftp/upload
sudo chown nobody:nogroup /home/$USERNAME/ftp 
sudo chmod a-w /home/$USERNAME/ftp 
sudo chown user1:user1 /home/$USERNAME/ftp/upload
echo "write_enable=YES" | sudo tee -a /etc/vsftpd.conf

echo "chroot_local_user=YES" | sudo tee -a /etc/vsftpd.conf

echo "allowed_writeable_chroot=YES" | sudo tee -a /etc/vsftpd.conf


echo "userlist_enable=YES" | sudo tee -a /etc/vsftpd.conf
echo "userlist_file=/etc/vsftpd.userlist" | sudo tee -a /etc/vsftpd.conf
echo "userlist_deny=NO" | sudo tee -a /etc/vsftpd.conf

sudo service vsftpd restart

echo "Done!!!!!!!!!!!!!!!!!"

else

echo "run with sudo -i "

fi
