#!/bin/bash

#character masher keeps looping untill the control character is met 
#Jamie - 21/11/19

inputArguement=$1
lettersIn=0 
digitsIn=0
otherChars=0



if [ $inputArguement = "-h" ]
then 
 printf "This is a masher script, it will take the input string and add it to any subsequent strings, control char is *, \n Remember to escape any bash characters using \. this is unavoidable due to the nature of bash \n Jamie-08/12/19\n"
 exit 
fi

string="${inputArguement}"
#sets how long the string is for the loop to iterate through
len=$((length-1))
len=${#string}


#takes the reading and looks for the control char
reading=1
while [ $reading -eq "1" ]
do
 read -p "Enter another string or put an * for nothing else. " word 
 string="$string$word"
 len=$((length-l))
 len=${#word}
for k in $(seq 0 $len); #loops through the input
 do
  currentChar=${word:$k:1}
  if [ "$currentChar" = "*" ]
  then
   reading=0 #stop taking user input 
   break
  fi
 done
done 


length=$((length-1))
length=${#string}

#loops through all the characters in the sting looking for the control char 
for i in $(seq 0 $length);
do
 #tally up all the different char types 
 currentChar=${string:$i:1}
 if [ "$currentChar" = "*" ]
  then 
  controlLocation=$((i+1))  
  break
 elif [[ "$currentChar" == [a-z] ]]
 then
  lettersIn=$((letersIn+=1)) 
 elif [[ "$currentChar" == [0-9] ]]
 then
  digitsIn=$((digitsIn+=1))
 elif [[  "$currentChar" == [A-Z] ]]
 then
  lettersIn=$((lettersIn+=1))
 else
  otherChars=$((otherChars+=1))
fi
done


#output strings 
printf "\nThe full string is $string\n\n"
echo "Found control character at location $controlLocation"

printf "Number of digits in the string: $digitsIn\n"
printf "Number of letters in the string: $lettersIn\n"
printf "Number of non alpha numeric characters in the string: $otherChars\n\n"
printf "Total number of characters in the string $length (Includes control characters)\n" 
printf "Total number of characters mashed before control value $i\n"

















 #printf "Value to mash: $inputArguement\n" 
 #read -p "Enter another string or a * to exit " "input"
 #input=$input + $input 
 #for chars in seq $[#"hello"]
 #do 
  #echo $chars
#done

#if [ "$input" = "*" ]
 #then
  #stopRead="false"
  #echo $Read
 #fi 
#done


 
