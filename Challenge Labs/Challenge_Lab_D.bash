#!/bin/bash
#!/bin/bash
# Author: Johan Vennberg jvg19001
#DVA239


#Cut the first column of the file. In this case the name of the services. Then piping it to the grep who remove all empty lines ($) and all line with a comment(#)
#Piping to sort where it sorted a-b and all duplicates are removed with --unique. the a stdout to the file. If this succed the wc -l comman will print the number of lines in the file
cut -f1 /etc/services | grep -v '^$\|^#' |sort --unique > uniqueservices.txt && wc -l uniqueservices.txt

#Print first & last 10 lines of the file
head uniqueservices.txt
tail uniqueservices.txt
