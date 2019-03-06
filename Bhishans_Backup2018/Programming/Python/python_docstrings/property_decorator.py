#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Jun-24-2017 Sat
# Last update : 
#
""" 
This program is an example of property decorator in python class.

Ref: https://www.programiz.com/python-programming/property


"""
#
# Imports
import time

#class Celsius(object):
    #def __init__(self,temp = 0):
        #self.temp = temp
        
    #def to_fahrenheit(self):
        #return self.temp * 1.8 + 32
 
# New update for version 1.01
# _ is private variable
# The big problem with the above update is that, 
# all the clients who implemented our previous 
# class in their program have to modify their code 
# from obj.temp to obj.get_temp() 
# and all assignments like obj.temp = val 
# to obj.set_temp(val).
#class Celsius(object):    
    #def __init__(self,temp = 0):
        #self.set_temp(temp)
        
    #def to_fahrenheit(self):
        #return self.get_temp() * 1.8 + 32
        
    
    #def get_temp(self):
        #return self._temp 
    
    #def set_temp(self,value):
        #if value < -273.15:
            #raise ValueError("""temp below -273.15 
                #Celsius is not possible.""")
        #self._temp = value


# Version 1.02 with decorator property
#class Celsius:
    #def __init__(self, temp = 0):
        #self.temp = temp

    #def to_fahrenheit(self):
        #return (self.temp * 1.8) + 32

    #def get_temp(self):
        #print("Getting value")
        #return self._temp

    #def set_temp(self, value):
        #if value < -273:
            #raise ValueError("temp below -273 is not possible")
        #print("Setting value")
        #self._temp = value

    #temp = property(get_temp,set_temp)
            
 
# Using @decorator 
# We do not require get_temp() and set_temp
class Celsius:
    def __init__(self, temp = 0):
        self._temp = temp

    def to_fahrenheit(self):
        return (self.temp * 1.8) + 32

    @property
    def temp(self):
        print("Getting value")
        return self._temp

    @temp.setter
    def temp(self, value):
        if value < -273:
            raise ValueError("temp below -273 is not possible")
        print("Setting value")
        self._temp = value



def main():
    # Create new obj
    #man = Celsius()
    #man.temp = 37
    
    #print(man.temp)
    #print(man.to_fahrenheit())
    #print(man.__dict__)
    
    # Test for upgrade 1.01
    #c = Celsius(-270)
    #print(c.get_temp())

    # Test for upgrade 1.02
    c = Celsius()
    print(c.temp)
    
    c.temp = 37
    print(c.to_fahrenheit())

if __name__=="__main__":
    main()
