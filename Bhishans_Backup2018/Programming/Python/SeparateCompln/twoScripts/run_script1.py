#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 14, 2016


# method 1
import os
print("\nStart of method1")
os.system("python script1.py")
print("End of method1\n\n")


#method 2
import subprocess
print("Start of method2")
subprocess.call("python script1.py 1", shell=True)
print("End of method2b\n")

#method 3
import subprocess
print("Start of method3")
cmd = 'python script1.py'
p = subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True)
out, err = p.communicate()
result = out.split('\n')
for lin in result:
    if not lin.startswith('#'):
        print(lin)
print("End of method3\n")
