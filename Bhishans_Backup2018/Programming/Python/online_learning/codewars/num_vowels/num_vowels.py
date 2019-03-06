#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-20-2016 Thu
# Last update :
#
#
# Imports
def getCount(inputStr):
    import re
    return len(re.findall('[aeiou]',inputStr))


print(getCount('inputString'))
