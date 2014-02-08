#!/bin/bash

#Declare variables
path="$HOME/$1"             #Path to the class
name="Patrick Hennessy"     #Your name
pawprint="PH7VC"            #Pawprint
stunum="18031828"           #Student number
date=`date +"%m-%d-%y"`     #Current date in month-day-year format
template="$2"               #Template file
outputfile="$3"             #Command-line arg from user
ext=`echo $template | sed -E 's/.*\///g' | sed -E 's/^[^\.]*\.//g'` #pulls the file extension from the template file name

#Check if arg 1 exists
if [ -z "$outputfile" ]; then
    echo "[ERROR] Please define a file type. Valid types: lab# || hw#"
    exit 1
fi

#Get file path from arg 1
if [[ $outputfile =~ ^lab[0-9]+$ ]]; then
    path="$path/$outputfile"
elif [[ $outputfile =~ ^hw[0-9]+$ ]]; then
    path="$path/$outputfile"
else
    echo "[ERROR] \"$outputfile\" is not a recognized file type. Valid types: lab# || hw#"
    exit 1
fi

#If the file already exists, ask user to overwrite
if [ -f $path/$outputfile.$ext ]; then
    echo -n "[WARNING] $outputfile.$ext already exists, overwrite? [y/n] " #For ease of useability and safety, we should make any non-y input equal no.
    read input

    if [ ! $input = "y" ]; then
        echo "[ERROR] Aborting $outputfile.$ext creation"
        exit 1
    fi
fi

#Make the project directory and load template file
if [ ! -d $path ]; then
    mkdir -p -v $path
fi

cat $template | sed -e "s/\%DATE/$date/g" -e "s/\%NAME/$name/g" -e "s/\%PAWPRINT/$pawprint/g" -e "s/\%STUDENTNUMBER/$stunum/g" -e "s/\%TITLE/$outputfile/g" > $path/$outputfile.$ext

#Check error status on making the file
if [ $? -ne 0 ]; then
    echo "[ERROR] File creation error"
    exit 1
fi

echo "File \"$outputfile.$ext\" creation successful."
cd $path
