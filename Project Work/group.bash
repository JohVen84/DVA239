# Functions to manage groups
# Author Johan Vennberg
#!/bin/b
INPUT=/tmp/menu.sh.$$

function addAGroup {
  dialog --title "Create a group" \
  --backtitle "Project Work" \
  --inputbox "Enter groupname " 8 60 2>$INPUT
  groupname=$(<$INPUT)

    if [ -z "$(getent group $groupname)" ]; then
      dialog --title 'Message' --msgbox "Succed. Adding group..." 5 20
      groupadd $groupname
      else
      dialog --title 'Message' --msgbox "Group alreay exists" 5 60
      addGroup
    fi
  }


function listGroups {
  cut -d: -f1 /etc/group | sort > tmp.txt
  dialog --title "Groups" --backtitle "Project work" \
  --textbox tmp.txt 20 60
}

function listGroupAssociations {
  dialog --title "List a group associations" \
  --backtitle "Project Work" \
  --inputbox "Enter groupname " 8 60 2>$INPUT

  groupname=$(<$INPUT)
  grep $groupname /etc/group > tmp.txt

  dialog --title "Groups" --backtitle "Project work" \
  --textbox tmp.txt 20 40
}

function addUsertoGroup {
  dialog --title "Add user to group" \
  --backtitle "Project Work" \
  --inputbox "Enter groupname " 8 60 2>$INPUT

  groupname=$(<$INPUT)

  dialog --title "Add user to group" \
  --backtitle "Project Work" \
  --inputbox "Enter username " 8 60 2>$INPUT

  username=$(<$INPUT)

  usermod -a -G $groupname $username

  echo $username added to $groupname > tmp.txt

  dialog --title "Groups" --backtitle "Project work" \
  --textbox tmp.txt 20 40

}

function removeUser {
  dialog --title "Remove user from group" \
  --backtitle "Project Work" \
  --inputbox "Enter groupname " 8 60 2>$INPUT

  groupname=$(<$INPUT)

  dialog --title "Remove user from group" \
  --backtitle "Project Work" \
  --inputbox "Enter username " 8 60 2>$INPUT

  username=$(<$INPUT)

  deluser $groupname $username

  echo $username deletet from $groupname > tmp.txt

  dialog --title "Groups" --backtitle "Project work" \
  --textbox tmp.txt 20 40
}
