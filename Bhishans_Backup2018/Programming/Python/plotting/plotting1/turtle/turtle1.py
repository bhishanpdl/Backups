#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Feb 18, 2016

# Ref     : https://pypi.python.org/pypi/PhysicalTurtle/0.4

# Imports
from turtle import Turtle
t1 = Turtle()
t1.forward(100)

from physicalturtle.example_follow import*
#run_me()

from physicalturtle.example_walk import run_ahead, run_behind
run_ahead()
#run_behind()

