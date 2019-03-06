#!/usr/bin/env python3
# -*- coding: utf-8 -*-#
#
# Author      : Bhishan Poudel; Physics Graduate Student, Ohio University
# Date        : Thu Mar 23, 2017
# Last update :
# Est time    :

# Imports
import numpy as np
import itertools as it

# given list
L = [2.1, 2.2, 2.3, 2.4, 2.5, 3.1, 3.2, 3.3, 3.4, 4.1, 4.2, 4.3, 4.4, 5.1, 5.2,
     5.3, 5.4, 5.5, 5.6, 6.1, 6.2, 6.3, 6.4, 6.5, 7.1, 7.2, 7.3, 7.4, 7.5,
     8.1, 8.2, 8.3, 8.4, 8.5, 9.1, 9.2, 9.3, 9.4, 9.5, 10.1, 10.2, 10.3,
     10.4, 10.5, 11.1, 11.2, 11.3, 11.4, 11.5, 12.1, 12.2, 12.3, 12.4, 12.5]


# method 1
for k, g in it.groupby(L, lambda x: int(x)):
    # print(str(k)+','+str(int(round(max(i % 1 for i in g)*10,1))))
    pass


# method 2
vals = []
foo = [str(e).split('.') for e in L]  # [['2', '1'], ['2', '2'], ... ]
for key, igroup in it.groupby(foo, lambda x: (x[0])):
    igroup = list(igroup)  # only required if we want to print group
    vals.append([int(e) for e in max(igroup)])
    print(key, ':', igroup)  # igroup is generator, it vanishes after one use.
print('foo=\n', foo)
print('\nfoo[0]=', foo[0])
print('\nvals=', vals)
