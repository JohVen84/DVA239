# Functions to manage users
# Author Johan Vennberg

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

function listUsers {
  cut -d: -f1 /etc/group | sort
}

function modifyAttributes {

}

function setPassword {
  passwd $1
}
