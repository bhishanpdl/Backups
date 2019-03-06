#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import re

# change word u to you and keep every thing else same
text = 'how are u? umberella u! u. U. U@ U# u '
ans = 'how are you? umberella you! you. you. you@ you# you'
print(re.sub(r'(?<![a-zA-Z0-9])[uU](?![a-zA-Z0-9])', 'you', text))
print(re.sub(r'(?<!\w)[uU](?!\w)', 'you', text))
print(re.sub(r'(?<![a-z])u(?![a-z])', 'you', text, flags=re.IGNORECASE))
print(re.sub(r'(?<![a-z])u(?![a-z])', 'you', text, flags=re.I))
print(re.sub(r'\b[uU]\b', 'you', text))

# Positive and Negative Lookbehind
#
# Lookbehind has the same effect, but works backwards.
# It tells the regex engine to temporarily step backwards in the string,
#  to check if the text inside the lookbehind can be matched there.
#   (?<!a)b matches a "b" that is not preceded by an "a",
#   using negative lookbehind. It doesn't match cab,
#    but matches the b (and only the b) in bed or debt.
#     (?<=a)b (positive lookbehind) matches the b
#     (and only the b) in cab, but does not match bed or debt.
#
# The construct for positive lookbehind is (?<=text):
# a pair of parentheses, with the opening parenthesis
# followed by a question mark, "less than" symbol,
# and an equals sign. Negative lookbehind is written
# as (?<!text), using an exclamation point instead of an equals sign.
