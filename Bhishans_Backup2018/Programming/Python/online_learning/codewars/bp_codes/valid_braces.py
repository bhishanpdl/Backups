#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Jun-22-2017 Thu
# Last update : 
#
# Write a function called validBraces that takes a string of braces, and 
# determines if the order of the braces is valid. validBraces should return 
# true if the string is valid, and false if it's invalid.

# This Kata is similar to the Valid Parentheses Kata, but introduces 
# four new characters. Open and closed brackets, and open and closed curly braces. 
# Thanks to @arnedag for the idea!

# All input strings will be nonempty, and will only consist of open 
# parentheses '(' , closed parentheses ')', open brackets '[', 
# closed brackets ']', open curly braces '{' and closed curly braces '}'.

# What is considered Valid? A string of braces is considered valid if all 
# braces are matched with the correct brace. 
# For example:
# '(){}[]' and '([{}])' would be considered valid, while '(}', '[(])', 
# and '[({})](]' would be considered invalid.

# Examples: 
# validBraces( "(){}[]" ) => returns true 
# validBraces( "(}" ) => returns false 
# validBraces( "[(])" ) => returns false 
# validBraces( "([{}])" ) => returns true 


def validBraces(string):    
    while len(string) > 0:        
        if "()" in string:
            string = string.replace("()", "")
        elif "[]" in string:
            string = string.replace("[]", "")
        elif "{}" in string:
            string = string.replace("{}", "")
        else:
            return False
    
    return True  
    
def validBraces(s):
  while '{}' in s or '()' in s or '[]' in s:
      s=s.replace('{}','')
      s=s.replace('[]','')
      s=s.replace('()','')
  return s==''

if __name__=="__main__":
    a = validBraces('[({)]}')
    print('\n')
    print(a)
