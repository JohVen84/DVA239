#!/bin/bash
#Author Johan Vennberg

group=$1
user=$2

groupadd $1

useradd -g $1 $2

pass = "password"

passwd $2

cd /
mkdir $2

chown $2:$1 /$2
chmod 1770 $2
