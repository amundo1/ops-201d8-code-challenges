#!/bin/bash

# Script Name:                  Ops Challenge - Day2 demo Bash Script
# Author:                       Adrian Mundo
# Date of latest revision:      20230426
# Purpose:                      Demo Bash script

# Declaration of variables
loginHist=last
messageVar="This is the login history."

# Declaration of functions
loginHistOutput () {
    $loginHist
    echo
    echo $messageVar


}

# Main
loginHistOutput

# End
