#!/usr/bin/env python
#
# example of regular expression re.match with method match
# source: http://www.thegeekstuff.com/2014/07/python-regex-examples/

import re

mymatch = re.match(r'dog', 'dog cat dog cat cat')  # if we search other than d/do/dog (eg.rat) we will get error
print mymatch.group(0)                    # AttributeError: 'NoneType' object has no attribute 'group'


mymatch2 = re.search(r'cat', 'dog cat dog cat cat')
print mymatch2.group(0)

mymatch3 = re.findall(r'dog', 'dog cat dog cat cat')
print mymatch3              # output:  ['dog', 'dog']
#print mymatch3.group(0)    # if we use .group(0) we will get error
                            #  AttributeError: 'list' object has no attribute 'group'

mymatch4= re.search(r'cat', 'dog cat dog cat')
print mymatch4.start()  # match starts at 4th character of the string
print mymatch4.end()    # mathc ends   at 7th character of the string