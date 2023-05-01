#!/bin/bash

# Script Name:                  Ops Challenge - Day2 demo Bash Script
# Author:                       Adrian Mundo
# Date of latest revision:      20230426
# Purpose:                      Demo Bash script

# Declaration of variables
loginHist=last
messageVar="This is the login history."
i=0


# Declaration of functions
loginHistOutput () {
    $loginHist
    echo
    echo -e $messageVar "\n\n"
    echo -e "**********************************************************************\n"
    echo -e $1 '\n\n'
    echo -e "***********************************************************************\n"


}

# Main
loginHistOutput 1
loginHistOutput 2
loginHistOutput 3

# End
