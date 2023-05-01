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

        # Creates a function in an infinite while loop where it:
         #initiates a process (ping), displays all processes, requests user input for ping process ID to kill
         #kills process
killPID () {
while true #infinite while loop
do

ping 8.8.8.8 &>/dev/null & #starts ping process in background
ps aux #displays processes
echo -e "Please choose ping PID to kill: \n" #requests PID from user
read pid #reads user input and assigns string to pid variable
kill -9 $pid #kills process identified by user
done
}

# Main


killPID #calls function

# End