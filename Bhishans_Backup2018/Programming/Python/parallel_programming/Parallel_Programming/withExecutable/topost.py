# clear; python topost.py; rm *~

#!/usr/bin/python

from multiprocessing import Pool
import os, sys, subprocess, math, re, shutil,copy

#function to run a program and write output to the shell
################################################################################
def run_process(arguments):
    name = arguments[0]
    args = arguments[1]

    print("---------------------------------------------------------")
    print("Running: %s"%name)
    print("Command:")
    for arg in args:
        print(arg, end=' ')
    print("")
    print("---------------------------------------------------------")
    process = subprocess.Popen(args)
    process.communicate()
################################################################################
        
# example 1
run_process(["prog1.c", './prog1'])
run_process(["prog2.c", './prog2'])        
run_process(["prog3.c", './prog3', 'first argument'])


# example 2 (parallizing)
commands = []
for x in range(20):
    commands.extend((["prog1.c","./prog1"]))
    commands.extend((["prog2.c","./prog2"]))
    commands.extend((["prog3.c","./prog3", "first argument"]))
    

#print (commands)    

#p = Pool()
#p.map(run_process,commands)



#function to run a program and write output to the shell
################################################################################
def run_process2(name, args,):
    print("-----------------------------------------------------------")
    print("Running: %s"%name)
    print("Command:")
    for arg in args:
        print(arg, end=' ')
    print("")
    print("-----------------------------------------------------------")
    process = subprocess.Popen(args)

    process.communicate()
    if process.returncode != 0:
        print("Error: %s did not terminate correctly. Return code: %i."%(name, process.returncode))
        sys.exit(1)  # this will exit the code in case of error
###########################       

print ("\n\n")
run_process2("prog3.c", ['./prog3', 'first argument'])
