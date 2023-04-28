#!/bin/bash

# Script Name:                  Ops Challenge - Day04
# Author:                       Adrian Mundo
# Date of latest revision:      20230427
# Purpose:                
# Write a script that: Creates four directories: dir1, dir2, dir3, dir4
# Put the names of the four directories in an array
# References the array variable to create a new .txt file in each directory

# Declaration of variables
dirs=()
files=()

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

# Main

createDir
#echo ${dirs[*]} #checks directory array
#echo ${files[*]} #checks files array
# End