#!/bin/bash

#Jamie - 20/11/19
#Utility to safely remove files and move them to a .bin directory 

binLocation=~/.waste

if ! [ -e $binLocation  ]
then
 mkdir $binLocation
 printf "Making waste directory in location $binLocation\n"
elif [ $# -eq 0 ]
then
 printf "Invalid number of arguements please enter one file to move to waste\n"
 exit
fi 


#Takes all the arguments and loops through all files and moves them to .waste directory
for fileName in "$@" 
do
 if [ -e $fileName ]
 then 
  mv $fileName $binLocation
  printf "Moved $fileName to bin successfully\n"
 else 
  printf "Error file $fileName does not exsist:\n"
 fi
done 
