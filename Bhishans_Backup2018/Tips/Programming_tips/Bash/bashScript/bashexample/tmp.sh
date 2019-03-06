#!/bin/bash

# bash tmp.sh

clear
echo "welcome..."
sleep 2
echo "how is your day so far?"
read ans
clear
echo "you typed $ans"
echo "$ans" >> ans.txt
