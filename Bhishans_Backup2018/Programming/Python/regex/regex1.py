#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import re

instr = '11170_tcd001-20160824-094716.txt'
outstr = re.sub(r'-\d{8}-\d{6}\b', '', instr)
# substitute hyphen 8 digits hyphen 6 digits boundary by empty string.
print(outstr)  # 11170_tcd001.txt

# method 2
regex = '(.+?)(-\d+-\d+)(\.\w+)'
regex = '(.+?)-(\d+?)-\d+?(\.\w+)'
a, b, c = re.search(regex, instr).groups()
print(a, b, c)
