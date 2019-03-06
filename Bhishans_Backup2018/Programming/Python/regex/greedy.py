#!/usr/bin/env python

import re

s = '<html><head><title>Title<\\title>'         # \\t = \t
print len(s)                                    # length of string is 32
print re.match('<.*>', s).span()                # (0,32)
print

print re.match('<.*>', s).group()               # <html><head><title>Title</title>
print re.match('<.*?>', s).group()              # <html>

#The RE matches the '<' in <html>, and the .* consumes the rest of the string.
#There's still more left in the RE, though, and the > can't match at the end of the string,
#  so the regular expression engine has to backtrack character by character until
# it finds a match for the >. The final match extends from the '<' in <html> to
# the '>' in </title>, which isn't what you want.
#In this case, the solution is to use the non-greedy qualifiers *?, +?, ??, or {m,n}?, which
# match as little text as possible. In the above example, the '>' is tried immediately after
# the first '<' matches, and when it fails, the engine advances a character at a time, retrying the '>' at
# every step. This produces just the right result:



