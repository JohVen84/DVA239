# Functions to manage users
# Author Johan Vennberg


function addAUser {

  dialog --title "Create an user" \
  --backtitle "Project Work" \
  --inputbox "Enter username " 8 60 2>$INPUT
  username=$(<$INPUT)

    if [ -z "$(getent passwd $username)" ]; then
      dialog --title 'Message' --msgbox "Succed. Adding user..." 5 20
      useradd $username
      else
      dialog --title 'Message' --msgbox "User alreay exists" 5 20
      addUser
    fi
  }

function listUsers {
  cut -d: -f1 /etc/passwd | sort > tmp.txt
  dialog --title "Users" --backtitle "Project work" \
  --textbox tmp.txt 20 60
}

function modifyAttributes {
  dialog --title "Select an user" \
  --backtitle "Project Work" \
  --inputbox "Enter username " 8 60 2>$INPUT
  username=$(<$INPUT)

  dialog --title "Modify or list an user)" \
  --backtitle "Project Work" \
  --menu "Select a management action in the menu below:" 20 60 13 \
  view "View properties" \
  username "Changge username" \
  uid "Change userid" \
  group "Change primary group" \
  comment "Change comment"  \
  dir "Change home directory" \
  shell "Change shell" 2>"${INPUT}"

  menuitem=$(<"${INPUT}")

  case  $menuitem in
    view) viewUser $username;;
    username) changeUsername $username;;
    uid) changeUid $username;;
    group) changeGroup $username;;
    comment) modifyComment $username;;
    dir) changeDir $username;;
    shell) changeShell $username;;
  esac


}

function viewUser {
  grep $1 /etc/passwd > tmp.txt

  password=$(cut tmp.txt -d: -f2)
  uID=$(cut tmp.txt -d: -f3)
  gID=$(cut tmp.txt -d: -f4)
  comment=$(cut tmp.txt -d: -f5)
  homedir=$(cut tmp.txt -d: -f6)
  shell=$(cut tmp.txt -d: -f7)

  echo -e " Password:" '\t' $password '\n' \
  "User ID:" '\t' $uID '\n'  \
  "Group ID:" '\t' $gID '\n' \
  "Comment:" '\t' $comment '\n'  \
  "Home:  " '\t' $homedir  '\n' \
  "Shell: " '\t' $shell > tmp.txt

  dialog --title "User" --backtitle "Project work" \
  --textbox tmp.txt 10 40
}

function changeUsername {
  dialog --title "Select a new username" \
  --backtitle "Project Work" \
  --inputbox "Enter new username " 8 60 2>$INPUT
  username=$(<$INPUT)

  usermod -l $username $1
}

function changeUid {
  dialog --title "Select new Uid" \
  --backtitle "Project Work" \
  --inputbox "Enter new uid " 8 60 2>$INPUT
  uid=$(<$INPUT)

  usermod -u $uid $1
}

function changeGroup {
  dialog --title "Select new Group" \
  --backtitle "Project Work" \
  --inputbox "Enter new group " 8 60 2>$INPUT
  group=$(<$INPUT)

  usermod -g $group $1
}

function modifyComment {
  dialog --title "Modify Comment for user" \
  --backtitle "Project Work" \
  --inputbox "Enter a comment " 8 60 2>$INPUT
  comment=$(<$INPUT)

  usermod -c $comment $1
}

function changeDir {
  dialog --title "Change home directory" \
  --backtitle "Project Work" \
  --inputbox "Enter path " 8 60 2>$INPUT
  path=$(<$INPUT)

  usermod -d $path $1
}

function changeShell {
  dialog --title "Change shell" \
  --backtitle "Project Work" \
  --inputbox "Enter new shell " 8 60 2>$INPUT
  shell=$(<$INPUT)

  usermod -s $shell $1
}

function setPassword {

  dialog --title "Set a password" \
  --backtitle "Project Work" \
  --inputbox "Enter username " 8 60 2>$INPUT
  username=$(<$INPUT)

  dialog --title "Set a password" \
  --backtitle "Project Work" \
  --passwordbox "Enter new password " 8 60 2>$INPUT
  password=$(<$INPUT)

  echo -e "$password\n$password"| (passwd $username)

  echo $?
}
