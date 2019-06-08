#!/bin/bash
#!/bin/bash
# Author: Johan Vennberg jvg19001
#DVA239

#I divided this script into 3 functions to solve the problem

# This function add a group. With the getent command we can check if the group allready exists.
#The -z option returns true if an empty string is returned
#The groupname is a parameter to addUser function

function addGroup {
  echo "###CREATE GROUP###"
  echo -n "Enter groupname:"
  read groupname

  if [ -z "$(getent group $groupname)" ]; then
    echo "Succed. Adding group..."
    groupadd $groupname
    addUser $groupname
  else
    echo "Group alrerady existis, try again"
    addGroup
  fi
}

#The same idea hera as in previous function
function addUser {

  echo "###CREATE USER###"
  echo -n "Enter username:"
  read username

  if [ -z "$(getent passwd $username)" ]; then
    echo "Succed. Adding user..."
    useradd -g $1 $username
    manageDir $username $1
  else
    echo "Username alrerady existis, try again"
    addUser $1
  fi
}
#A function to create a directory and manage the premission
function manageDir {

  mkdir /$1

  chown $1:$2 /$1
  chmod 1770 /$1
}

#the single command to excecute the rest of the script
addGroup
