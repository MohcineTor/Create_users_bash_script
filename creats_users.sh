#!/bin/bash

#Define the array of usernames 

usernames=("user1" "user2" "user3") 

#loop through the usernames and create the users 

for username in "${usernames[@]}"
do	
    sudo useradd -m -s /bin/bash "$username"
    echo "$username:qwerty" | sudo chpasswd
    sudo chown -R "$username:$username" "/home/$username"
    sudo chmod 700 "/home/$username"
    sudo usermod -aG wheel "$username"
done 

echo "Users are created successfully"

sudo cat /etc/passwd | grep -i user

