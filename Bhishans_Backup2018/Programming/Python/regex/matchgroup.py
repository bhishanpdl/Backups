#!/usr/bin/env python
#
# example of regular expression re.match with method match
# source: http://www.thegeekstuff.com/2014/07/python-regex-examples/

import re

print "\nexample: match grouping"
contactInfo = 'Doe, John: 555-1212'
match1 = re.search(r'(\w+), (\w+): (\S+)', contactInfo)

print match1.group(0)       # everything inside ''
print match1.group(1)       # (\w+),    all the word characters before comma
print match1.group(2)       # (\w+):    all the word characters before colon
print match1.group(3)       # (\S+)     all the non-space characters

#Grouping by Name Using match.group
print "\nexample: match grouping with names"
print "We shall add ?P<any_name> at the beginning of ()"

match = re.search(r'(?P<last>\w+), (?P<first>\w+): (?P<phone>\S+)', contactInfo)

print match.group('last')   # (?P<last>\w+),
print match.group('first')  # (?P<first>\w+):
print match.group('phone')  # (?P<phone>\S+)
