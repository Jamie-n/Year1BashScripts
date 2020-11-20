#!/bin/bash 
#Jamie - 07/12/19
#currencyConverter - uses the wrap command to connect to a website and retrieve exchange rates and convert them in real time. 


fromCurr=$1
toCurr=$2
value=$3
errSym="{"

#Checks to see if there are 3 arguements passed
if [ $# -ne "3" ]
then 
 printf "\nScript requires 3 arguements currency1, currency2, value.\n" 
 exit 
fi


#Builds the web request to the exchange rates server
webReq="https://free.currconv.com/api/v7/convert?q="$fromCurr"_"$toCurr"&compact=ultra&apiKey=e04738079971009ee03d"
result=$(curl -s "$webReq") #makes the call to the exchange rates
 
#extracts only the exhange rate from the returned data 
parsedResult=$(echo "$result" | cut -d : -f 2 | cut -d } -f 1)

#checks to see if there is nothing returned from the server, happens if there is an incorrect curr code
if [ "$parsedResult" == "$errSym" ]
then 
 printf "Error check input arguements\n"
 exit
fi


printf "\nThe result of the conversion was; "
temp=$(echo "$value*$parsedResult" | bc) #perfoms the maths on the exchange rate 
printf "%'.2f $toCurr\n" $temp #formats the output into a readable currency format 

































































