# Functions to manage folders
# Author Johan Vennberg

function newFolder {
  dialog --title "Create a folder" \
  --backtitle "Project Work" \
  --inputbox "Enter path " 8 60 2>$INPUT
  path=$(<$INPUT)

  dialog --title "Create a folder" \
  --backtitle "Project Work" \
  --inputbox "Enter folder name" 8 60 2>$INPUT
  folder=$(<$INPUT)

  cd $path
  mkdir $folder
}

function listFolder {
  dialog --title "Create a folder" \
  --backtitle "Project Work" \
  --inputbox "Enter path " 8 60 2>$INPUT
  path=$(<$INPUT)

  ls $path > tmp.txt

  dialog --title "Listing folder content" --backtitle "Project work" \
  --textbox tmp.txt 20 60

}

function folderMenu {
dialog --title "Modify a folder" \
--backtitle "Project Work" \
--inputbox "Enter path " 8 60 2>$INPUT
path=$(<$INPUT)

dialog --title "Modify or list a directory)" \
--backtitle "Project Work" \
--menu "Select a management action in the menu below:" 20 60 13 \
view "View properties" \
rights "Changge permissions" \
owner "Change owner" \
group "Change group owner" \
setgid "Modify setgid"  \
sticky "Set a sticky bit" 2>"${INPUT}"

menuitem=$(<"${INPUT}")

case  $menuitem in
  view) ListFolderAttributes $path;;
  rights) changePermissions $path;;
  owner) changeOwner $path;;
  group) changeGroup $path;;
  setgid) setsigd $path;;
  sticky) setSitckyBit $path;;
esac
}

function ListFolderAttributes {
    permissionsO=$(stat -c%a $1)
  permissionsH=$(stat -c%A $1)
  owner=$(stat -c%U $1)
  group=$(stat -c%G $1)
  modified=$(stat -c%y $1)


  echo -e " Rights(Octal):" '\t' $permissionsO '\n'  \
  "Rights(Human):" '\t' $permissionsH '\n' \
  "Owner: " '\t''\t' $owner '\n' \
  "Group Owner: "'\t''\t' $group '\n' \
  "Last modified:" '\t' $modified > tmp.txt

  dialog --title "Folder attributes" --backtitle "Project work" \
  --textbox tmp.txt 10 48
}

function changePermissions {
  dialog --title "Change Permissions" --backtitle "Project work" \
  --inputbox "Enter new rights in octal format" 8 60 2>$INPUT
  rights=$(<$INPUT)

  chmod $rights $1
}

function changeOwner {
  dialog --title "Change Owner" --backtitle "Project work" \
  --inputbox "Enter username" 8 60 2>$INPUT
  username=$(<$INPUT)

  chown $username $1
}

function changeGroup {
  dialog --title "Change Group Owner" --backtitle "Project work" \
  --inputbox "Enter groupname" 8 60 2>$INPUT
  groupname=$(<$INPUT)

  chgrp $groupname $1
}

function setsigd {
  bit=2
  currentrights=$(stat -c%a $1)

  rights=$bit$currentrights
  echo $rights
  echo Johan
  chmod $rights $1

}

function setSitckyBit {
  bit=1
  currentrights=$(stat -c%a $1)

  rights=$bit$currentrights
  echo $rights
  echo johan
  chmod $rights $1

}
