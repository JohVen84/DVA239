#!/bin/bash
# Author: Johan Vennberg

# Switch to root user & change dir to root
su -
cd /

# Create directories for each department
mkdir engineering
mkdir sales
mkdir is

# Add a group for each department
groupadd engineering
groupadd sales
groupadd is

# Add the admin user
useradd -g engineering -d /engineering engineering_admin
useradd -g sales -d /sales sales_admin
useradd -g is -d /is is_admin

# Add standard users
useradd -g engineering -d /engineering eng1
useradd -g engineering -d /engineering eng2

useradd  -g sales -d /sales sales1
useradd -g sales -d /sales sales2

useradd -g is -d /is is1
useradd -g is -d /is is2

# Change owner of each directory

chown engineering_admin:engineering /engineering
chown sales_admin:sales /sales
chown is_admin:is /is

#Change Permission & set sticky bit
chmod 1770 engineering
chmod 1770 sales
chmod 1770 is

#setguid
chmod g+s engineering
chmod g+s sales
chmod g+s is

#Create files in each department directory

touch /engineering/doc.txt
echo “This file contains confidential information for the department.” > /engineering/doc.txt
touch /sales/doc.txt
echo “This file contains confidential information for the department.” > /sales/doc.txt
touch /is/doc.txt
echo “This file contains confidential information for the department.” > /is/doc.txt
