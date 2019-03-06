#!/usr/bin/env python
#
# example of regular expression re.match with method match
# source: http://www.shutupandship.com/2012/02/regular-expressions-in-python-re-module.html

import re

patt = re.compile(
   r"""
    # The username (capture it)
    (?P<username>\w+)
    # followed by @
    @
    # followed by the domain (also capture it)
    (?P<domain>\w+\.\w+)""",
    re.VERBOSE | re.IGNORECASE)

txt = "My emails are derp@dm1.net and herp@dm2.com."

# print the attributes of the Pattern object
for attr in ['pattern', 'groups', 'groupindex']:
    print 'patt.{0:<12}: {1}'.format(attr, getattr(patt, attr))
print "patt.{0:<12}: {1}".format('flags', bin(patt.flags))
print "patt.search(txt) :\n\t%s" %patt.search(txt)
print "patt.findall(txt):\n\t%s" %patt.findall(txt)
print "patt.split(txt)  :\n\t%s" %patt.split(txt)
print "patt.sub('abc@efg.com', txt):\n\t%s" %patt.sub('abc@efg.com', txt)
print

mtch = patt.search(txt)
# print the attributes and the methods of the Match object
for attr in ['re', 'pos', 'endpos', 'lastindex', 'lastgroup', 'string']:
    print 'mtch.{0:<12}: {1}'.format(attr, getattr(mtch, attr))
for method in ['group', 'groups', 'groupdict', 'start', 'end', 'span']:
    print 'mtch.{0:<12}: {1}'.format(method+'()', getattr(mtch, method)())