#!/bin/bash

# Script Name:                  Ops Challenge - Day0
# Author:                       Adrian Mundo
# Date of latest revision:      20230501
# Purpose:                
#Write a script that:
#Detects if a file or directory exists, then creates it if it does not exist.
#Your script must use at least one array, one loop, and one conditional.

# Declaration of variables
dirs=()
files=()
lsArray=()
grepArray=()
dirsArray=()


# Declaration of functions

        # Creates array of directories and creates a respective text file in each directory
createDir () {
for ((i=1; i<5; i++))
do
    dirs+=("dir$i")
    mkdir ${dirs[i-1]}
    cd ${dirs[i-1]}
    files+=("file$i.txt")
    touch ${files[i-1]}
    cd ..
done
}

        #checks current directory for directories; if it does not exist a new directory and .txt file is created
checkDir () {
for ((i=1; i<9; i++)) #for loop for number of directories to create
do
    lsArray+=("$(ls | grep "dir")") #creates an array from ls filtered by "dir"
    #grepArray=($(echo ${lsArray[@]} | tr ' ' '\n')) #| sort | uniq -u #removes unwanted characters and spaces from array
    #dirsArray=($(echo ${dirs[@]} | tr ' ' '\n')) #removes unwanted characters and spaces from array
    echo -e "Checking Directories: \n"
   
    if [[($(echo ${lsArray[i-1]} | tr ' ' '\n')) && ($(echo ${dirs[i-1]} | tr ' ' '\n'))]]; then # #removes unwanted characters and spaces from arrays adn checks if array element is the same
        echo -e "$i Checks good\n No new Directories created"
    else #creates new directories and filesif one does not exist
        echo -e "NOGO\n Creating New Directory"
        dirs+=("dir$i")    
        mkdir ${dirs[i-1]}
    echo -e ${dirs[i-1]}
    cd ${dirs[i-1]}
    files+=("file$i.txt")
    touch ${files[i-1]}
    cd ..
    fi
done
}
# Main

createDir #calls function


#my_array=($(echo $my_string | tr ";" "\n"))
checkDir #calls function
#${dirs[@]}
#grepArray=("($lsArray | sed 's/,/\n/g')")
#echo $check
#echo ${grepArray[2]}
#echo ${dirsArray[2]}
#echo ${dirs[*]}
echo -e "*******************************Complete*********************\n"

# End