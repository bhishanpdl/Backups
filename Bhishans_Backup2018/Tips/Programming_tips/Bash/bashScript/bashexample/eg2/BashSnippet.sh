#!/bin/bash

#viewing environment variables
#echo "the value of the home variable is: "
#echo $HOME

# issue a command
# echo "the output of the pwd command is: "
# pwd

# that's boring, grab output and make it readable ( on the same line)
# echo "the value of pwd command is $(pwd)"

# assign command output to a variable
# no space between output and = 
output=$(pwd)
echo "The value of the output variable is ${output}"

#view data on the command line
# echo "I saw $@ on the command line"

# read data from the user
# echo "Enter a value: "
# read userInput
# echo "You just entered $userInput"

# concatenate userinput with command input
# echo "Enter a file extension: "
# read ext
# touch "yourfile.${ext}"

# check to see if a file exists
# if [ -d /etc/sysconfig ]; then
# 		echo "That file is there and a directory"
# else
