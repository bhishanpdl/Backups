#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Feb 18, 2016

import turtle

turtle.penup()
for i in range(1, 50, 10):
    turtle.right(90)    # Face South
    turtle.forward(i)   # Move one radius
    turtle.right(270)   # Back to start heading
    turtle.pendown()    # Put the pen back down
    turtle.circle(i)    # Draw a circle
    turtle.penup()      # Pen up while we go home
    turtle.home()       # Head back to the start pos

# Save the image
ts = turtle.getscreen()
ts.getcanvas().postscript(file="concentric_circles.eps")
