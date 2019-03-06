#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Feb 18, 2016

# Ref     : http://www.blog.pythonlibrary.org/2012/08/06/python-using-turtles-for-drawing/

from Tkinter import *
from turtle import *
import turtle


forward(100)

# Save the image
ts = turtle.getscreen()
ts.getcanvas().postscript(file="arrow_save.eps")

# example 2
bob = turtle.Turtle()
bob.fillcolor('orange')
bob.begin_fill()
bob.circle(20)
bob.begin_fill()

ts = bob.getscreen()
ts.getcanvas().postscript(file='arrow_save2.eps', colormode='color')
