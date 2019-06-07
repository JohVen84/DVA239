#!/bin/bash
#!/bin/bash
# Author: Johan Vennberg jvg19001
#DVA239


cut -f1 /etc/services | grep -v '^#' |grep -v '^$'|sort --unique > uniqueservices.txt && wc -l uniqueservices.txt

cut -f1 /etc/services | grep -v '^$\|^\s*\#' |sort --unique > uniqueservices.txt && wc -l uniqueservices.txt

head uniqueservices.txt
tail uniqueservices.txt
