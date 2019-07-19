#!/bin/bash
source group.bash
source user.bash
source folders.bash
source remote.bash

function start {
INPUT=/tmp/menu.sh.$$
while true
  do
  dialog --title "User and group manager" --backtitle "Project Work" --menu "Select a management action in the menu below:" 20 60 13 \
  group:create "Create new groups" \
  group:view "List the current groups in the system" \
  group:list "List users associations for individual groups" \
  group:add "Add users to groups" \
  group:delete "Deleter users from groups" \
  user:create "Create a user" \
  user:view "View the current users in the system" \
  user:modify "Modify user properties" \
  user:password "Change password" \
  folder:create "Create a new folder" \
  folder:list "List folder content" \
  folder:modify "Modify folder properties" \
  ssh:menu "Menu for remote acess" 2>"${INPUT}"

  menuitem=$(<"${INPUT}")


  # make decsion
  case $menuitem in
  	group:create) addAGroup;;
    group:view) listGroups;;
    group:list) listGroupAssociations;;
    group:add) addUsertoGroup;;
    group:delete) deleteUser;;
    user:create) addAUser;;
    user:view) listUsers;;
    user:modify) modifyAttributes;;
    user:password) setPassword;;
    folder:create) newFolder;;
    folder:list) listFolder;;
    folder:modify) folderMenu;;
    ssh:menu) startMenu;;
  esac

  done
}


if which dialog > /dev/null; then
   start
else
 echo "Dialog is not installed, do you want to install? Enter y to install "
 read choice
 if [ $choice == "y" ]; then
 apt-get update
 apt-get install dialog -y
 start
 else
     echo "Welcome back!"
 fi
 fi
