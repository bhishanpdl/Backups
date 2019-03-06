#!/bin/bash

# source : https://www.youtube.com/watch?v=NSu4IWlOU7k
# general rule one command per line keep 
# everything flushed left

touch tempfile.txt  # create tempfile.txt there
chmod 777 tempfile.txt

# method 1 to execute the script
# bash basicscript.sh

# method 2 to make executable
# chmod 775 basicscript.sh
# to check if it is executable
# ls -l basicscript.sh
# output:
# -rwxrwxr-x 1 bhishan bhishan 323 Jul 14 14:29 #  basicscript.sh
# to run executable:
# ./basicscript.sh





