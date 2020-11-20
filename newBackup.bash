#!/bin/bash
#Jamie - 07/12/19
#newBackup.bash - small utilty to backup set locations into a backup file 

backupLoc=~/assignment/backupLocations.txt
backupDir=~/_backupLoc

input=$backupLoc

#checks to see if the text file exists, elif checks if it needs new directory
if [ ! -e $backupLoc ]
then 
 printf "Backup file not found, does not exist or is empty\n"
 exit 
elif [ ! -e $backupDir ]
then
 printf "Backup directory does not exist making new directory at $backupDir\n"
fi

while IFS= read -r line  #Reads the lines of the text file 
do
 fileLoc=~/$line #Concatanates the file name into a fill directry path 
 if [ -e $fileLoc ] #checks to see if the file specified exists 
  then
  cp -r $fileLoc $backupDir #Copies the directory 
  printf "$line Directory backed up sucessfully.\n"
  sleep 0.2
  else
  printf "$fileLoc, Dir does not exist, check backup file\n"  
 fi
#when the program reaches the end of the file
done < $input


