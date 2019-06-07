#!/bin/bash
#!/bin/bash
# Author: Johan Vennberg jvg19001
#DVA239

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

function manageDir {

  mkdir /$1

  chown $1:$2 /$1
  chmod 1770 /$1
}

addGroup
