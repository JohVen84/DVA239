#!/bin/bash


cat /etc/services

cut -f1 /etc/services | grep -v '^#' |sort --unique > uniqueservices.txt 




cut -f1 /etc/services | grep -v '^#' |grep '^$'|sort --unique > uniqueservices.txt
