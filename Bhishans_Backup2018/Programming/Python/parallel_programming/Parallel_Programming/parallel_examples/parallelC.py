#!/usr/bin/python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Feb 10, 2016


# Imports
from multiprocessing import Process,Pool

def foo():
    print("foo")

def bar():
    print("bar")

p1 = Process(target=foo, args=())
p2 = Process(target=bar, args=())

p1.start()
p2.start()
p1.join()
p2.join()

# usign Pool
def foo():
    print("foo using Pool")

def bar():
    print("bar using Pool")

pool = Pool(processes=2)
p1 = pool.apply_async(foo)
p1 = pool.apply_async
pool.close()


# The first scenario starts two separate processes
# (call them P1 and P2) and starts P1 running foo and P2
# running bar, and then waits until both processes have
# finished their respective tasks.
#
# The second scenario starts two processes
# (call them Q1 and Q2) and first starts
# foo on either Q1 or Q2, and then starts
# bar on either Q1 or Q2.
# Then the code waits until both function
# calls have returned.
