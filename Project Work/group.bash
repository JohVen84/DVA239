# Functions to manage groups
# Author Johan Vennberg

function addGroup {
  function addGroup {
    echo "###CREATE GROUP###"
    echo -n "Enter groupname:"
    read groupname

    if [ -z "$(getent group $groupname)" ]; then
      echo "Succed. Adding group..."
      groupadd $groupname
      else
      echo "Group alrerady existis, try again"
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
