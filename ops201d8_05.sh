#!/bin/bash

# Script Name:                  Ops Challenge - Day05
# Author:                       Adrian Mundo
# Date of latest revision:      20230428
# Purpose:                
#Write a script that:
#Displays running processes
#Asks the user for a PID
#Kills the process with that PID
#Starts over at step 1 and continues until the user exits with Ctrl + C
#Use a loop so that the script will continuously start over, displaying the running processes, asking the user for input, etc.

# Declaration of variables
pid=""


# Declaration of functions

        # Creates array of directories and creates a respective text file in each directory
killPID () {
while true
do

ping 8.8.8.8 &>/dev/null &
ps aux
echo -e "Please choose ping PID to kill: \n"
read pid
kill -9 $pid
done
}

# Main


killPID

# End