#!/bin/bash

if [ -z "$1" ]
  then
    echo "No argument supplied"
    echo "usage: $0 <username>"
    exit
fi

username=$1
echo "proceeding with \$username=$username"

# create user with the name passed as cli argument
echo "creating new user..."
adduser $username

echo "creating ssh group..."
groupadd ssh

echo "adding $username to ssh group..."
usermod -a -G sudo,ssh $username

echo "adding root to ssh group, root may already exist in this group..."
usermod -a -G ssh root

echo "allowing users in ssh group to use ssh..."
echo "AllowGroups ssh" >> /etc/ssh/sshd_config

echo "restarting sshd.service..."
systemctl restart sshd
systemctl restart ssh


echo "copying authorised ssh keys file to the new user's home..."
mkdir /home/$username/.ssh
chmod 700 /home/$username/.ssh
cp /root/.ssh/authorized_keys /home/$username/.ssh/authorized_keys
chown -R $username:$username /home/$username/.ssh
chmod 600 /home/$username/.ssh/authorized_keys
echo "done..."

echo "Some other config changes may be required in the sshd_config file to avoid root login..."

exit
