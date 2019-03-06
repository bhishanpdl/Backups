#!/usr/bin/env python
# source: https://www.daniweb.com/software-development/python/threads/131590/search-and-replace-with-recompile-
## descripitons: https://docs.python.org/2/library/re.html
#  descriptions: http://www.shutupandship.com/2012/02/regular-expressions-in-python-re-module.html

import re

#re.compile
##############
print                                       # There are two main actors in the re module - the Pattern object
pattern = re.compile("\w+")                 # (also called as RegExObject in Python documentation) and the Match object.
words = pattern.findall("Hello World")      # we compile a pattern object and call some methods (eg. findall,search,match)on it
print words
                                            # instead of compiling a Pattern object and calling the findall() method on it,
                                            # we can directly use the findall() function in the re module
words = re.findall(r"\w+", "Hello World")   # Behind the scenes, re module just creates a Pattern object
print words                                 # and calls its findall() method.

# match(), search() and the Match object
#########################################
print                                              # The match() and search() methods of the Pattern object return
if re.search(r"\w+@\w+\.\w+", "My name is ABC"):   # either Match objects if there is a match or None if there is no match
     print "The text has email \
     address"
else:
     print "The text has no email address"
                                                            ##Other methods of the Pattern object
# example search for email                                  ################################################

if re.search(r"\w+@\w+\.\w+", "My email is abc@efg.com"):   # Pattern object provides other methods findall(), 
															# finditer(), split(), sub()and subn()
     print "The text has email address"         # (which are also available as convenience functions in the re module).
else:                                           # These methods are simple to use and the documentation is very 
											    # clear about how they work.
     print "The text has no email address"      # They just return a list (or iterator) of the matches or the new string with
                                                # matched replaced with the alternate text supplied.
                                                # In most cases, for simple lookups, substituions etc.,
                                                # these methods will do in a pinch.
#example 3
print
string1  = re.compile('(abc|def|ghi)')          # string1 = abc|def|ghi
string2  = 'xyz abc mno def'
result   = string1.findall(string2)
print result                                    # output:  ['abc', 'def']
print (string1)									# output: <_sre.SRE_Pattern object at 0x7fa58511c5d0>
print string2									# output: xyz abc mno def

#example 4
print
string1  = re.compile('(abc|def|ghi)')
string2  = 'xyz abc mno def'
result   = string1.sub('zzz', string2)          # string1 and string2 matches are replaced by zzz
print result                                    # output: xyz zzz mno zzz






# re.compile(pattern, flags=0)
###################################
# Compile a regular expression pattern into a regular expression object,
# which can be used for matching using its match() and search() methods, described below.
#
# The expression?s behaviour can be modified by specifying a flags value.
# Values can be any of the following variables, combined using bitwise OR (the | operator).
#
#     Example:
#
#     prog = re.compile(pattern)     # pattern = [\w] for example
#     result = prog.match(string)
#
#     is equivalent to
#
#     result = re.match(pattern, string)
#
#     but using re.compile() and saving the resulting regular expression object for reuse
# is more efficient when the expression will be used several times in a single program.
#
#     Note:
#  The compiled versions of the most recent patterns passed to re.match(), re.search() or
#  re.compile() are cached, so programs that use only a few regular expressions at a time
#  neednot worry about compiling regular expressions.

#  re.findall(pattern, string, flags=0)
# #########################################
#
# Return all non-overlapping matches of pattern in string, as a list of strings.
# The string is scanned left-to-right, and matches are returned in the order found.
# If one or more groups are present in the pattern, return a list of groups;
# this will be a list of tuples if the pattern has more than one group.
# Empty matches are included in the result unless they touch the beginning of another match.

#  re.sub(pattern, repl, string, count=0, flags=0)
##################################################
# Return the string obtained by replacing the leftmost non-overlapping occurrences of pattern in string by the replacement repl.
# If the pattern isn?t found, string is returned unchanged. repl can be a string or a function; if it is a string, any backslash
# escapes in it are processed. That is, \n is converted to a single newline character, \r is converted to a carriage return, and so forth.
# Unknown escapes such as \j are left alone. Backreferences, such as \6, are replaced with the substring matched by group 6 in the pattern.


# # re.compile() and the Pattern Objects
#############################################
# There are two main actors in the re module - the Pattern object
# (also called as RegExObject in Python documentation) and the Match object.
# All the usual services that you expect out of regular expressions, such as scanning a text and finding all matches,
# checking whether there is a match etc., are available as methods of the Pattern object. So, for example,
# if you want to find all portions of a string that match a particular RegEx, you should first
# compile a Pattern object and then invoke its findall() method

# re module convenience functions
#######################################
# The re module also provides all the methods of the Pattern object as convenience functions
# directly at the module level. For example, instead of compiling a Pattern object and calling
# the findall() method on it, you can directly use the findall() function in the re module.

