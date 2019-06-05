#!/bin/bash

touch tmp.txt

#the user decide how many inputs with an arguement to the script,
#then looping each line for stdin and stdout to a textfile
i=1
while [ "$i" -le "$1" ]; do
  echo -n $i:
  read var
  echo $var >> tmp.txt
  i=$(($i + 1))
done

#Printing the first and last line, with head and taill
echo "--------------------"
echo "First and last line"
(head -n1 && tail -n1) <file
#Clean up
rm tmp.txt
