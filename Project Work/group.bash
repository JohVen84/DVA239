# Functions to manage groups
# Author Johan Vennberg
#!/bin/b
INPUT=/tmp/menu.sh.$$

function addGroup {
  dialog --title "Create a group" \
  --backtitle "Project Work" \
  --inputbox "Enter groupname " 8 60 2>$INPUT
  groupname=$(<$INPUT)

  repsonse=$?

    if [ -z "$(getent group $groupname)" ]; then
      dialog --title 'Message' --msgbox "Succed. Adding group..." 5 20
      groupadd $groupname
      else
      dialog --title 'Message' --msgbox "Group alreay exists" 5 60
      addGroup
    fi
  }
}

function listGroups {
  cut -d: -f1 /etc/group | sort
}

function listGroupAssociations {
  grep $1 /etc/group
}

function addUser {
  usermod -a -G $1 $2
}

function removeUser {
  deluser $1 $2
}
