#!/bin/bash

echo -n "Enter the username for the new user:"                                  
read username                                                                   
                                                                                
getent passwd $username >> /dev/null                                            
                                                                                
while [ $? -eq 0 ]                                                              
  do                                                                            
    echo -n "User already created\n"                                            
    echo -n "Please enter another username: "                                   
    read username                                                               
    getent passwd $username >> /dev/null                                        
  done                                                                          
                                                                                
echo -n "Enter a group name: \n"                                                
read groupname                                                                  
                                                                                
getent group $groupname >> /dev/null                                            
                                                                                
while [ $? -eq 0 ]                                                              
  do                                                                            
   echo -e "Group already exists\n"                                             
   echo -e "Please enter another group name: \n"                                
   read groupname                                 
   getent group $groupname >> /dev/null                                         
  done                                                                 
                                                                                
groupadd $groupname                                                             
useradd -m -s /bin/bash -g $groupname $username 
passwd $username                              
                                                                                
echo -n "User created\n"                                                       
                                                                                
mkdir /$username                                                                
chown $username.$groupname /$username                                           
chmod 1770 /$username
