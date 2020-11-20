#!/bin/bash


#Utility to list all the files in the waste bin and their size in bytes
#Jamie - 20/11/19

wasteBinLocation=~/.waste/*

#allows the wildcard to see '.' files
shopt -s dotglob

#checks to see if the waste bin exists
if [ -d "~/.waste" ]
then
 printf "\nWaste Bin does not exist.\n\n"
 exit
fi

#checks to see if the waste bin has already been emptied 
if [ ! "$(ls -A ~/.waste)" ];
then
 echo "Waste bin is empty"
 exit 
fi 

#loops through all the items in the waste bin and states their name and size
for item in $wasteBinLocation;
do
if [ -d $item ]
 then 
  fileName=$(basename $item)
  fileSize=$(du -h $item | cut -f1)  
  printf "The directory $fileName is:  \n$fileSize\n"
  echo "---------------------------------"
  sleep 0.2
else 
 fileName=$(basename $item)
 fileSize=$(du -h $item | cut -f1)
 printf "The file $fileName is: $fileSize\n"
 echo "----------------------------------"
fi
done 


printf "The total size of the waste bin is: "
du -ch $wasteBinLocation | grep total | cut -f1

shopt -u dotglob
