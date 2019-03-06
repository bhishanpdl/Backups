#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-12-2016 Wed
# Last update :
#
#
# Imports
import multiprocessing as mp
from multiprocessing import Process
import random

times = 10000000

def process(count, jobid, output):
  pom = []
  for i in range(count):
      pom.append(random.random())
  print("Job ", jobid, " finished!")

out1 = list()
out2 = list()

job = []
job.append(Process(target=process, args=(times, 'A', out1)))
job.append(Process(target=process, args=(times, 'B', out2)))

for j in job:
  j.start()
for j in job:
  j.join()

print("Finished!")
