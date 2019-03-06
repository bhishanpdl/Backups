#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel, Physics PhD Student, Ohio University
# Note        :kwarg means keyword argument

def func(*args, **kwargs):
    for arg in args:
        print(arg)
        
    
    # Keyword arguments
    print("\n")
    for kwarg in kwargs:
        print(kwarg, *kwarg)
    
    
func(1, "Welcome", name="Bhishan", year=2015)

# ((1, 'Welcome'), {'name': 'thefourtheye', 'year': 2013})

