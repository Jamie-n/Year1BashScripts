#!/bin/bash


#Jamie - 19/11/19
# Command that takes filenames as its arguements and maes those files 
#executable to all users 

if [ $# -eq 0 ] 
then 
 echo "Please enter one file to make executable!"
fi

for i in "$@" #Iteraates through all items 
do
currentFile=$i

#if the file exsists and is not already executable 

 if [ -e $currentFile ] && ! [ -x $currentFile ] 
 then
  echo "Making the file $currentFile executable to all users."
  chmod 111  $currentFile
 else
  echo "File $currentFile not found or is already executable:" 
  continue
 fi 

 
done 
