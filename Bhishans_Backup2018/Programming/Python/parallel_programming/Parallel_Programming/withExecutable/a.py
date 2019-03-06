#!/usr/bin/python


# clear; unsetenv PYTHONHOME; unsetenv PYTHONPATH; python a.py; rm -f *~
# python a.py; rm -f *~

# note: executable are different for MacOS and Linux

from multiprocessing import Pool
import os, sys, subprocess, math, re, shutil,copy
import time

#function to run a program and write output to the shell
################################################################################
def run_process(name, args,):
    print("--------------------------------------------------------------------")
    print("Running: %s"%name)
    print("Command:")
    for arg in args:
        print(arg, end=' ')
    print("")
    print("--------------------------------------------------------------------")

    # start time
    start_time = time.time()

    # run the subprogram
    process = subprocess.Popen(args)

    process.communicate()
    if process.returncode != 0:
        print("Error: %s did not terminate correctly. Return code: %i."%(name, process.returncode))
        sys.exit(1)  # this will exit the code in case of error

    # print the time taken
    end_time = time.time()
    seconds = end_time - start_time
    m, s = divmod(seconds, 60)
    h, m = divmod(m, 60)
    d, h = divmod(h, 24)
    print("\nTime taken to run program '{}' ==> {:2.0f} days, {:2.0f} hours,\
          {:2.0f} minutes, {:f} seconds.".format( name, d, h, m, s))


    
################################################################################
        
# example 1        
run_process("prog3.c", ['./prog3', 'first argument'])


## parallizing the code
#commands = []
#for x in range(20):
#    commands.extend(("prog1.c",['./prog1']),
#                    ("prog2.c",['./prog2']),
#                    ("prog3.c",['./prog3','first argument']))

#p = Pool()
#p.map(run_process, commands)







