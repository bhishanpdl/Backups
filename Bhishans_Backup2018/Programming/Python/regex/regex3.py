#!/usr/bin/env python

# topic: regex
# source : http://code.runnable.com/UqV9JYh03AFGAACS/how-to-use-findall-finditer-split-sub-and-subn-in-
# regular-expressions-in-python-for-regex
import re

string = "Once you have accomplished small things, you may attempt great ones safely."

print "\nexample"
# Return all words beginning with character 'a', as a list of strings
print re.findall(r"\ba[\w]*", string)   # \b is boundary of \w and |W
# ['accomplished', 'attempt']

print "\nexample2"
# Return all words beginning with character 'a', as an iterator yielding match objects
it = re.finditer(r"\ba[\w]*", string)
for match in it:
    print "'{g}' was found between the indices {s}".format(g=match.group(), s=match.span())
# 'accomplished' was found between the indices (14, 26)
# 'attempt' was found between the indices (49, 56)


print "\nexample3"
# Split string by any character which is not a UNICODE word character
print re.split("\W+", string)
# ['Once', 'you', 'have', 'accomplished', 'small', 'things', 'you', 'may', 'attempt',
# 'great', 'ones', 'safely', '']

print "\nexample4"
# Split string by any character which is not a UNICODE word character at most 2 split
print re.split("\W+", string, 2)
# ['Once', 'you', 'have accomplished small things, you may attempt great ones safely.']


print "\nexample5"
# If the splitting pattern does not occur in the string,
# string is returned as the first element of the list
print re.split("(:)", string)
# ['Once you have accomplished small things, you may attempt great ones safely.']

print "\nexample6"
# Replace all occurrences of space, comma, or dot with colon
print re.sub("[ ,.]", ":", string)
# Once:you:have:accomplished:small:things::you:may:attempt:great:ones:safely:

print "\nexample: sub"
# Replace maximum 2 occurences of pattern
print re.sub("[ ,.]", ":", string, 2) # there will be 2 strings separated by colon
# Once:you:have accomplished small things, you may attempt great ones safely.

print "\nexample: subn"
# Replace as 'sub', but return a tuple of (new string, number of replacements)
print re.subn("[ ,.]", ":", string)
# ('Once:you:have:accomplished:small:things::you:may:attempt:great:ones:safely:', 13)


print "\nexample: findall"
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

# \B
# Matches the empty string, but only when it is not at the beginning or end of a word.
# This means that r'py\B' matches 'python', 'py3', 'py2', but not 'py', 'py.', or
# 'py!'. \B is just the opposite of \b, so is also subject to the settings of LOCALE and
# UNICODE.

# The "*", "+"  qualifiers are all greedy...
# Adding "?" after the qualifier makes it perform the match in
# non-greedy or minimal fashion...