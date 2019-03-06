#!/usr/bin/env python

# re = regular expresssion is a module in Python
# functions of re module are : group,match,search etc. ( PLEASE LOOK AT THE END)
#examples:
#source:
# https://developers.google.com/edu/python/regular-expressions
# https://docs.python.org/2/library/re.html
# if we get <_sre.SRE_Match object at 0x10fa35850> like this just add .group(0) at the end of result


import re

print "example 0"
print
str     = 'one two three'
match   = re.search(r"\btwo\b", str)
print match
print match.group(0)

print "example 1"
str = 'purple alice-b@google.com monkey dishwasher'
match = re.search('([\w.-]+)@([\w.-]+)', str)
if match:
    print match.group()   ## 'alice-b@google.com' (the whole match)
    print match.group(1)  ## 'alice-b' (the username, group 1)
    print match.group(2)  ## 'google.com' (the host, group 2)

#example 2
print "\nexample2"
## Suppose we have a text with many email addresses
str = 'purple alice@google.com, blah monkey bob@abc.com blah dishwasher'

## Here re.findall() returns a list of all the found email strings
emails = re.findall(r'[\w\.-]+@[\w\.-]+', str) ## ['alice@google.com', 'bob@abc.com']
for email in emails:
# do something with each found email string
    print email


#example 3 re.search
# match = re.search(pat, str)
# here, pattern = word:\w\w\w   this means word: and three letters

print "\nexample 3"
str = 'an example word:cats!!'
match = re.search(r'word:\w\w\w', str)
# If-statement after search() tests if it succeeded
if match:
    print 'found', match.group() ## 'found word:cat'
else:
    print 'did not find'

print "\nexample 4"
print(re.match('super', 'superstition').span()) #(0, 5)
print(re.match('super', 'insuperable'))         #None
print(re.search('super', 'superstition').span())    #(0, 5)
print(re.search('super', 'insuperable').span())     #(2, 7)


print "\nexample 4"
s = '<html><head><title>Title</title>'
print len(s)                        #32
print(re.match('<.*>', s).span())   # (0, 32)  .* is greedy
print(re.match('<.*>', s).group())  # <html><head><title>Title</title>
print(re.match('<.*?>', s).group()) #<html>     .*? is non-greedy

print "\nexample 5"
p = re.compile(r'\W+')
p2 = re.compile(r'(\W+)')
print p.split('This... is a test.')
print p2.split('This... is a test.')

print "\nexample 6"
p = re.compile(r'\W+')
print p.split('This is a test, short and sweet, of split().')     # maxsplit = 0 here
print p.split('This is a test, short and sweet, of split().', 3)  # maxsplit = 3 here

print"\nexample 7"
m1 = re.search('(?<=d)ef', 'abcdefghijkl')  # ?<=  looks after given letter, and search pattern = ef
print m1.group(0)   # output: ef
                    # this works for <=abcd, <=bcd, but for <=c it gives Attribute Error


print"\nexample 8"
print "This example looks for a word following a hyphen:"
print "given word: spam-eggs"
m = re.search('(?<=-)\w+', 'spam-eggs')  # W = not alphanumeric or underscore [^a-zA-Z0-9_]
print m.group(0)    # output: eggs



## Regualr Expression Functions:                                 Regular Expression Objects               Match Objects
#################################                                ##############################           #######################

#1  re.compile(pattern, flags=0)                                 #1  search(string[, pos[, endpos]])      #1  expand(template)
#2  re.DEBUG                                                     #2  match(string[, pos[, endpos]])       #2  group([group1, ...])
#3  re.I (re.IGNORECASE)                                         #3  split(string, maxsplit=0)            #3  groups([default])
#4  re.L (re.LOCALE )                                            #4  findall(string[, pos[, endpos]])     #4  groupdict([default])
#5  re.M (re.MULTILINE)                                          #5  finditer(string[, pos[, endpos]])    #5  start([group])
#6  re.S (re.DOTALL)                                             #6  sub(repl, string, count=0)           #6  end([group])
#7  re.U (re.UNICODE)                                            #7  subn(repl, string, count=0)          #7  span([group])
#8  re.X (re.VERBOSE)                                            #8  flags                                #8  pos
#9  re.search(pattern, string, flags=0)                          #9  groups                               #9  endpos
#10 re.match(pattern, string, flags=0)                           #10 groupindex                           #10 lastindex
#11 re.split(pattern, string, maxsplit=0, flags=0)               #11 pattern                              #11 lastgroup
#12 re.findall(pattern, string, flags=0)                                                                  #12 re
#13 re.finditer(pattern, string, flags=0)                                                                 #13 string
#14 re.sub(pattern, repl, string, count=0, flags=0)
#15 re.subn(pattern, repl, string, count=0, flags=0)
#16 re.escape(string)
#17 re.purge()
#18 exception re.error


# Basic patterns:
# word = alphanumeric or underscore
#   pattern       meaning
#
#   \number      Matches the contents of the group of the same number
#   \A          start
#   \b          empty at the beginning or end of word
#   \B          empyt but not at the beginning or end of word
#   \d          decimal digit [0-9]
#   \D          non-digit [^0-9]
#   \s          whitespace [ \t\n\r\f\v]
#   \S          non-whitespace [^  \t\n\r\f\v]
#   \w          word [a-zA-Z0-9_]
#   \W          non-word [^a-zA-Z0-9_]
#   \z          end of string

# The "*", "+", and "?" qualifiers are all greedy...
# Adding "?" after the qualifier makes it perform the match in
# non-greedy or minimal fashion...


# ordinary characters=      a-z,A-z,0-9,_
#
#  meta-characters=         . ^ $ * + ? { [ ]  | ( )
#
#
# . (a period)
# matches any single character except newline 'n'
#
# w
# matches a "word" character: a letter or digit or underbar [a-zA-Z0-9_].
# It only matches a single character not a whole word.
#
# W
# matches any non-word character.
#
# w+
# matches one or more words / characters
#
# b
# boundary between word and non-word
#
# s
# matches a single whitespace character, space, newline, return, tab, form
#
# S
# matches any non-whitespace character.
#
# t, n, r
# tab, newline, return
#
# D
# matches anything but a digit
#
# d
# matches a decimal digit [0-9]
#
# d{1,5}
# matches a digit between 1 and 5 in lengths.
#
# {n} d{5}
# matches for 5 digits in a row
#
# ^
# match the start of the string
#
# $
# match the of the string end
#
# *
# matches 0 or more repetitions
#
# ?
# matches 0 or 1 characters of whatever precedes it
#
#
# use . to match a period or  to match a slash.
#
# If you are unsure if a character has special meaning, such as '@', you can
# put a slash in front of it, @, to make sure it is treated just as a character.

# \number
# Matches the contents of the group of the same number. Groups are numbered
# starting from 1. For example, (.+) \1 matches 'the the' or '55 55', but not 'thethe'
# (note the space after the group). This special sequence can only be used to match
# one of the first 99 groups. If the first digit of number is 0, or number is 3 octal digits
# long, it will not be interpreted as a group match, but as the character with octal value
# number. Inside the '[' and ']' of a character class, all numeric escapes are treated
# as characters.

# \A
# Matches only at the start of the string.

# \b
# Matches the empty string, but only at the beginning or end of a word. A word is
# defined as a sequence of alphanumeric or underscore characters, so the end of a
# word is indicated by whitespace or a non-alphanumeric, non-underscore character.
# Note that formally, \b is defined as the boundary between a \w and a \W character (or
# vice versa), or between \w and the beginning/end of the string, so the precise set of
# characters deemed to be alphanumeric depends on the values of the UNICODE and
# LOCALE flags. For example, r'\bfoo\b' matches 'foo', 'foo.', '(foo)', 'bar foo baz'
# but not 'foobar' or 'foo3'. Inside a character range, \b represents the backspace
# character, for compatibility with Python's string literals.


# \B
# Matches the empty string, but only when it is not at the beginning or end of a word.
# This means that r'py\B' matches 'python', 'py3', 'py2', but not 'py', 'py.', or
# 'py!'. \B is just the opposite of \b, so is also subject to the settings of LOCALE and
# UNICODE.


# \d
# When the UNICODE flag is not specified, matches any decimal digit; this is equivalent
# to the set [0-9]. With UNICODE, it will match whatever is classified as a decimal digit in
# the Unicode character properties database.


# \D
# When the UNICODE flag is not specified, matches any non-digit character; this is
# equivalent to the set [^0-9]. With UNICODE, it will match anything other than character
# marked as digits in the Unicode character properties database.
# 7.2. re ? Regular expression operations ? Python 2.7.10 doc... https://docs.python.org/2/library/re.html
# 7 of 24 7/7/15, 11:39 AM

# \s
# When the UNICODE flag is not specified, it matches any whitespace character, this is
# equivalent to the set [ \t\n\r\f\v]. The LOCALE flag has no extra effect on matching
# of the space. If UNICODE is set, this will match the characters [ \t\n\r\f\v] plus
# whatever is classified as space in the Unicode character properties database.

# \S
# When the UNICODE flag is not specified, matches any non-whitespace character; this
# is equivalent to the set [^ \t\n\r\f\v] The LOCALE flag has no extra effect on
# non-whitespace match. If UNICODE is set, then any character not marked as space in
# the Unicode character properties database is matched.

# \w
# When the LOCALE and UNICODE flags are not specified, matches any alphanumeric
# character and the underscore; this is equivalent to the set [a-zA-Z0-9_]. With LOCALE,
# it will match the set [0-9_] plus whatever characters are defined as alphanumeric for
# the current locale. If UNICODE is set, this will match the characters [0-9_] plus
# whatever is classified as alphanumeric in the Unicode character properties database.

# \W
# When the LOCALE and UNICODE flags are not specified, matches any non-alphanumeric
# character; this is equivalent to the set [^a-zA-Z0-9_]. With LOCALE, it will match any
# character not in the set [0-9_], and not defined as alphanumeric for the current
# locale. If UNICODE is set, this will match anything other than [0-9_] plus characters
# classified as not alphanumeric in the Unicode character properties database.

# \Z
# Matches only at the end of the string.


# source: https://docs.python.org/2/library/re.html
