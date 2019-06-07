#!/bin/bash
#!/bin/bash
# Author: Johan Vennberg jvg19001
#DVA239

cd /

mkdir ~/archive

#Bad soluiton? I tried things such as tar -cvf ~/archive/log.tar -C var/log . *.log  but either manage to get the whole directory or only the files with its pathname
#I think I could get som good feedback for this part
cd var/log
tar -cvf ~/archive/log.tar *.log

#List the conttents of the archivefile
tar -tf ~/archive/log.tar

#Extract to the backup directory
tar -xvf ~/archive/log.tar -C ~/backup

cd  ~/backup
ls
