#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Imports
import re

contactInfo = 'Doe, John: 555-1212'
match = re.search(r'(\w+), (\w+): (\S+)', contactInfo)
print(match.group(0))
print(match.group(1))
print(match.group(2))
print(match.group(3))

# \w word
# \s all whitespaces
# \S nonwhitespaces
