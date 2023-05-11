#!/bin/bash

# Script Name:                  Ops Challenge - Day 13
# Author:                       Adrian Mundo
# Date of latest revision:      20230510
# Purpose: Create a script that asks a user to type a domain, then displays information about the typed domain. 
#          Operations that must be used include:
#          - whois
#          - dig
#          - host
#          - nslookup
###############################################################################################################################

# Declaration of variables

domain="" #placeholder variable for user input
domainLookupfile="domain.txt" #Text document name



# Declaration of functions
domainLookup () {

echo -e "\n\n****************Please type domain name (example: google.com)**********************\n\n\n"
read domain # Requests user input and assigns input to placeholder variable
echo -e "\n\n\n******************Generating domain.txt with whois information******************\n\n\n"
whois $domain > $domainLookupfile # whois lookup for user input and output to text file
echo -e "\n\n\n******************Appending domain.txt with dig information******************\n\n\n"
dig $domain >> $domainLookupfile # dig lookup for user input and output to text file
echo -e "\n\n\n******************Appending domain.txt with host information******************\n\n\n"
host $domain >> $domainLookupfile # host lookup for user input and output to text file
echo -e "\n\n\n******************Appending domain.txt with nslookup information******************\n\n\n"
nslookup $domain >> $domainLookupfile # nslookup lookup for user input and output to text file

echo -e "\n\n\n******************Domain Lookup Complete******************\n\n\n"
}

# Main

domainLookup #calls function

cat domain.txt # opens text file in terminal



# End
