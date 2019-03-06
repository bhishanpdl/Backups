#!/usr/bin/python
# -*- coding: utf-8 -*-

#keyboard input

# raw_input is used to read text (strings) from the user:
# name=raw_input('Enter your name : ')
# print ("Hi %s, Let us be friends!" % name);
# print (30 * '*')
#
# # input is used to read integers
# age = input("What is your age? ")
# print "Your age is: ", age
# type(age)

#keyboard input
name = raw_input("What's your name? ")
print("Nice to meet you " + name + "!")
age = input("Your age? ")
print("So, you are are already " + str(age) + " years old, " + name + "!")

age = float(age)
print(age+2)
