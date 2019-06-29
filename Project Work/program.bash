#!/bin/bash
source group.bash

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
  	group:create) addGroup;;
    group:view) listGroups;;
  esac

  done
}


if which dialog > /dev/null; then
    start
else
  echo "Install dialog"
  apt-get install dialog
  start
fi
