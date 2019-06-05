#!/bin/bash


cat /etc/services

cut -f1 etc/services | grep -v '^#' |sort --unique > uniqueservices.txt 
