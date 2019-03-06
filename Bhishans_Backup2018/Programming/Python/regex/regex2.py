#!/usr/bin/env python


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



# Basic patterns
# a, X, 9 ordinary characters
#
# . ^ $ * + ? { [ ]  | ( )
# meta-characters
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