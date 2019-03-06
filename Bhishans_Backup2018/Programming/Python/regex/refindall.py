#!/usr/bin/env python

# #regular expression
# re.findall(pattern, string, flags=0)
# source: http://stackoverflow.com/questions/7752551/python-regex-findall

import re

print "\nexample1"

regex = ur"\[P\] (.+?) \[/P\]+?"        # u is unicode and r is raw string

line = "President [P] Barack Obama [/P] met Microsoft founder [P] Bill Gates   [/P], yesterday."
#                 \[P\]  (.+?)     \[/P\]                     \[P\]  (.+?)     \[/P\]

person = re.findall(regex, line)
print(person)       # output: ['Barack Obama', 'Bill Gates']
                    # To protect the literal brackets in [P], escape the brackets with a backslash: \[P\]
                    # To return only the words inside the tags, place grouping parentheses around .+?

# example 2
print "\nexample 2:"
mymatch3 = re.findall(r'dog', 'dog cat dog cat cat')
print mymatch3              # output:  ['dog', 'dog']
#print mymatch3.group(0)    # if we use .group(0) we will get error
                            #  AttributeError: 'list' object has no attribute 'group'

string = "Once you have accomplished small things, you may attempt great ones safely."

print "\nexample 3:"
print re.findall(r"\b\w{5}\b", string)   # only 5 characters
print re.findall(r"\b\w{5,}\b", string)  # at least 5 characters
print re.findall(r"\b\w{5,7}\b", string) # five or six or seven characters


# \b
# Matches the empty string, but only at the beginning or end of a word. A word is
# defined as a sequence of alphanumeric or underscore characters, so the end of a
# word is indicated by whitespace or a non-alphanumeric, non-underscore character.
# Note that formally, \b is defined as the boundary between a \w and a \W character (or
# vice versa), or between \w and the beginning/end of the string, so the precise set of
# characters deemed to be alphanumeric depends on the values of the UNICODE and
# LOCALE flags. For example, r'\bfoo\b' matches 'foo', 'foo.', '(foo)', 'bar foo baz'
# but not 'foobar' or 'foo3'. Inside a character range, \b represents the backspace


