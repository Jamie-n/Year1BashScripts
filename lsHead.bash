#!/bin/bash 

#Jamie - 19/11/19
#lists the first lines of every file in a directory specified by arguement lsHead 10 documents
#lists the first 10 lines of every file in the documents directory 

directoryToLook=$2
numberOfLines=$1

#uses regex to test that the arguement is a digit
case $numberOfLines in
 ''|*[!0-9]*)printf "Please enter the number of lines to read\n\n" 
 exit ;;  
 *)

#asks for the user to input if they would like the head or tail of the file
read -n1 -p "To read the head of file $file type H for tail type T:" userInput


if [ -e $directoryToLook ]
then
 echo "Listing $numberOfLines lines in the directory $directoryToLook" 
 case $userInput in
#Used to get head of the program 
 h|H) echo "Taking head"
  for file in "$directoryToLook"/*;
  do
   printf "The head of file $file is:\n\n------------------------------------------------------------------------------\n"
   head -n $numberOfLines $file
   sleep 1 
  done 
  ;;
#Used to get tail of the file 
 t|T) echo "Taking tail"
  for file in "$directoryToLook"/*;
  do 
   printf "The tail of file $file is:\n\n----------------------------------------------------------------\n"
   tail -n $numberOfLines $file
   sleep 1
  done
  ;; 

#if anything that isnt H/T is input 
 *) printf "Please give a valid input\n"
    break 
 esac 
#if the file does not exsist
else 
 printf "\nFile does not exsist\n"
 exit
fi
esac
