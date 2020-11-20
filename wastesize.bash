#!/bin/bash 

#Utility to see the number of files in the .waste location
#Jamie - 20/11/19 


binLocation=~/.waste


if ! [ -e $binLocation ]
then 
 printf "The waste bin does not exsist\n"
 exit 
fi

filesInBin=$(ls -1 $binLocation | wc -l)

if [ $filesInBin -eq 1  ]
then 
 printf "There is 1 file in the waste bin\n"
else 
 printf "There are $filesInBin files in the waste bin\n" 
fi
