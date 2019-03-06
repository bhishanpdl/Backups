#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-23-2016 Sun
# Last update :
#
#
# IPv4 stands for Internet Protocol Version 4.
# Since IPv4 ip address has only 32 bits (a total of 4,294,967,296
# (= 4.2e9)  unique ip-addresses can be stored.
# Each and every octet can have a value from 0 to 255.
# eg. 98.139.180.149   is for yahoo.
# http://98.139.180.149   is same as http://yahoo.com

# None should equal False
from itertools import groupby

def is_valid_IP(ip):
    return len([int(x) for x in ip.split('.')
                       if ( int(x) >= 0 and int(x) < 256
                                        and ip.count(' ') == 0 )
                                        and not (x.startswith('0') and len(x) > 1)
                                        ]) == 4


#print(is_valid_IP('170.0.3.4'))       # True
#print(is_valid_IP('226.0.66.88'))     # True
#print(is_valid_IP(' 1.2.3.4'))        # False
#print(is_valid_IP('A1.2.3.400'))      # False
#print(is_valid_IP('12.34.56.-1'))     # False
print(is_valid_IP('123.045.067.089'))  # False




##======================================================================
## mehtho1
##======================================================================
def is_valid_IP(strng):
    return len([x for x in strng.split('.')
                  if x.isdigit() and 0 <= int(x) <= 255
                                 and x.lstrip('0') == x
                                 ]) == 4


##======================================================================
## method2
##======================================================================
def is_valid_IP(strng):
  lst = strng.split('.')
  passed = 0
  for sect in lst:
    if sect.isdigit():
      if sect[0] != '0':
        if 0 < int(sect) <= 255:
          passed += 1
  return passed == 4
print(is_valid_IP('123.045.067.089')) # False




##======================================================================
## method3
##======================================================================

print(is_valid_IP('123.045.067.089')) # False

def is_valid_IP(address):
    return bool(__import__('re').match('(([1-9]?\d|1\d\d|2[0-4]\d|25[0-5])(\.(?!$)|$)){4}\Z',address))

# 123.045.067.089 # False
# (  ([1-9]?\d        # 0 is valid but 012 is not
#        |1\d\d       # 1xx  x is digit
#        |2[0-4]\d    # 2xd  x is 0,1,2,3,4
#        |25[0-5]     # less than 256
#     )
#     (\.(?!$)
#         |$
#     )
# )
# {4}\Z  # 4 octects before end

##======================================================================
## method4
##======================================================================
from re import compile, match

REGEX = compile(r'^((25[0-5]|2[0-4]\d|1\d\d|[1-9]\d|\d)\.){3}'
                r'(25[0-5]|2[0-4]\d|1\d\d|[1-9]\d|\d)$')


def is_valid_IP(strng):
    return bool(match(REGEX, strng))
print(is_valid_IP('123.045.067.089')) # False





##======================================================================
## method5
##======================================================================
def is_valid_IP(strng):
    if strng.count('.') != 3: return False
    try:
        tmp = list(str(n) for n in map(int,strng.split('.')) if 0 <= n <= 255)
    except:
        return False
    return strng == '.'.join(tmp)
