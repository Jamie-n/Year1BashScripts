#!/bin/bash

#Utility to empty the waste bin 
#Jamie - 20/11/19

wasteLocation=~/.waste/*




#checks to see if the waste bin is empty
 
if [ ! "$(ls -A ~/.waste)" ];
then
 printf "\n\nWaste bin is already empty.\n\n" 
 exit
fi   
 

read -p "Are you sure that you want to clear your waste bin Y/N: " userInput

case $userInput in 
y|Y) 
 printf "Emptying waste bin:\n"
 rm -r $wasteLocation
 sleep 0.5
 printf "\n\nProcess complete\n\n";;
n|N) 
 echo "exiting program" ;;
*) 
 echo "Please either put y/n" ;;
esac
