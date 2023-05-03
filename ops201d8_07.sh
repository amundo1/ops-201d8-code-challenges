#!/bin/bash

# Script Name:                  Ops Challenge - Day 07
# Author:                       Adrian Mundo
# Date of latest revision:      20230502
# Purpose:                      Uses grep to remove irrelevant information from the lshw output
#Add text to the output clearly indicating which component (such as CPU, RAM, etc.) the script is returning information about

# Declaration of variables
#computerName= head -n 1 $lookUpFile
cpu=("*-cpu" 6)
ram=("*-memory" 3)
displayAdapter=("*-display" 5)
netAdapter=("*-network" 14)
lookUpFile="lookuplshw.txt"

# Declaration of functions
greplshw () { 

echo -e "\nComputer Name: \n"
head -n 1 $lookUpFile


echo -e "\nCPU info: \n"    
grep -A ${cpu[1]}  ${cpu[0]} $lookUpFile | grep -vw "version"

echo -e "\nRAM info: \n"
grep -A ${ram[1]}  ${ram[0]} $lookUpFile

echo -e "\nDisplay Adapter info: \n"
grep -A ${displayAdapter[1]}  ${displayAdapter[0]} $lookUpFile

echo -e "\nNetwork Adapter info: \n"
grep -A ${netAdapter[1]}  ${netAdapter[0]} $lookUpFile


}

# Main
echo -e "\n\n\n*****************************************************Starting lshw Look up***********************************************\n\n\n"

sleep 2

sudo lshw > $lookUpFile
greplshw

echo -e "\n\n\n***************************************************** lshw Look up Complete***********************************************\n\n\n"
# End
