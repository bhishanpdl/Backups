#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-20-2016 Thu
# Last update :
#
#
# Imports
indices = set([0, 7, 12, 25])
s = "i like stackoverflow and python"
print("".join(c.upper() if i in indices else c for i, c in enumerate(s)))

print("".join(c.upper() if i%2 == 0 else c.lower() for i, c in enumerate(s)))
