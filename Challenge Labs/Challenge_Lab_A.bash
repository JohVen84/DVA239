#!/bin/bash
# Author: Johan Vennberg

# Change dir to root
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
