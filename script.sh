#!/bin/bash


echo 'Create a new user';
read -p 'Choose username: ' user_name;
getent passwd $user_name && echo "User already exist! Choose another name!" || useradd $user_name && echo 'User succesfully created!!!';




echo 'Create a new group';
read -sp 'Choose name of your group: ' group_name
if grep $group_name /etc/group; then
	echo "Group already exist! Choose another name!"
else
	groupadd $group_name
	echo "Group `tail -1 /etc/group` succesfully created!!!"
fi

usermod -s /bin/bash -g $group_name $user_name && mkdir /$user_name && chown $user_name:$group_name /$user_name && chmod 1770 /$user_name && su $user_name && passwd $user_name;
