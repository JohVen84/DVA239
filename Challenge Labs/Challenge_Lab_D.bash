#!/bin/bash


cut -f1 /etc/services | grep -v '^#' |sort --unique > uniqueservices.txt && wc -l uniqueservices.txt
