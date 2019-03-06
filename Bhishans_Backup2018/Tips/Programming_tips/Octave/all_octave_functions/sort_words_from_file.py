#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Author  : Bhishan Poudel
# Date    : May 23, 2016
# Ref     : https://stackoverflow.com/questions/18135967/creating-a-list-of-every-word-from-a-text-file-without-spaces-punctuation

# Imports
from __future__ import division
from __future__ import print_function

import re
file = open('all_octave_functions.txt', 'r')
# .lower() returns a version with all upper case characters replaced with lower case characters.
text = file.read().lower()
file.close()
# replaces anything that is not a lowercase letter, a space, or an apostrophe with a space:
text = re.sub('[^a-z\ \']+', " ", text)
words = list(text.split())

#print (sorted(words))
words_even=words(::2)


# print space separated
print("\n")
print (' '.join([ str(myelement) for myelement in words ]))
