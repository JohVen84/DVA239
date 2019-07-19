


function startMenu {
  dialog --title "Remote access menu (SSH)" --backtitle "Project Work" --menu "Select a management action in the menu below:" 20 60 13 \
    ssh:install "Install SSH" \
    ssh:uninstall "Uninstall SSH" \
    ssh:enable "Enable ssh in the system" \
    ssh:disable "Disable ssh in the system" \
    key:create "Generate a key" \
    key:list "List key in the system" \
    key:delete "Delete a key" \
    remote:transfer "Transfer a key to remote machine" \
    remote:connect "Connect to a remote machine" 2>"${INPUT}"

    menuitem=$(<"${INPUT}")

    case menuitem in
        ssh:install) installSSH;;
        ssh:uninstall) uninstallSSH;;
        ssh:enable) enableSSH;;
        ssh:disable) disableSSH;;
        key:create) createKey;;
        key:list) listKeys;;
        key:delete) deleteKey;;
        remote:transfer) transferKey;;
        remote:connect) connect;;
    esac
}

function installSSH {
    apt-get install openssh-server -y
}

function uninstallSSH {
    apt-get remove openssh-server
}

function enableSSH {
    systemctl start ssh
}

function disableSSH {
    systemctl stop ssh
}

function createKey {
  dialog --title "Set a passphrase" \
  --backtitle "Project Work" \
  --passwordbox "Enter a passphrase " 8 60 2>$INPUT
  password=$(<$INPUT)

  ssh-keygen -t rsa -N $password -f ~/.ssh/id_rsa > tmp.txt

  dialog --title "SSH key" \
  --backtitle "Project Work" \
  --textbox tmp.txt 10 40
}

function listKeys {
  ls -l  ~/.ssh/ > tmp.txt

  dialog --title "SSH key" \
  --backtitle "Project Work" \
  --textbox tmp.txt 10 40
}

function deleteKey {
  cd ~/.ssh/
  rm id_rsa.pub id_rsa
}

function transferKey {
  dialog --title "Select username on remote machine" \
  --backtitle "Project Work" \
  --inputbox "Enter username " 8 60 2>$INPUT
  username=$(<$INPUT)

  dialog --title "Select an IP-adress" \
  --backtitle "Project Work" \
  --inputbox "Enter IP-adress " 8 60 2>$INPUT
  ipAdress=$(<$INPUT)

  ssh-copy-id -i ~/.ssh/id_rsa.pub $username@$ipAdress
}

function connect {
  dialog --title "Select username on remote machine" \
  --backtitle "Project Work" \
  --inputbox "Enter username " 8 60 2>$INPUT
  username=$(<$INPUT)

  dialog --title "Select an IP-adress" \
  --backtitle "Project Work" \
  --inputbox "Enter IP-adress " 8 60 2>$INPUT
  ipAdress=$(<$INPUT)

  ssh ssh -i ~/.ssh/id_rsa.pub $username@$ipAdress
}
