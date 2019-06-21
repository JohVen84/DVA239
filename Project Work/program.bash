#!/bin/bash
source group.bash
if which dialog > /dev/null; then
    echo "Dialog allready installed. Skipping..."
else
    echo "Installing dialog..."
    apt-get install -y dialog
fi

function helloHey {
  dialog --title 'Message' --msgbox 'Hello hey!!' 5 20
}

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
  	group:create) helloHey;;
    group:view) listGroups;;
  esac

  done
