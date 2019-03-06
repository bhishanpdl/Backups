#!python
# -*- coding: utf-8 -*-#
"""
Reading files

@author: Bhishan Poudel
@date:  Nov 7, 2017
@email: bhishanpdl@gmail.com
# Imports
import numpy as np
from numpy.lib.recfunctions import append_fields
x = np.array([1, 2, 3])
y = np.array([2,3,5])
z = np.array([2,3,4])
def main():
    mylist = list(zip(x,y,z))
    data0 = np.array(mylist, dtype=[('x',float),('y',float),('z',float)])
    data = np.recarray(data0.shape, data0.dtype, buf=data0)
    tot = data['x'] + data['y'] + data['z'] # sum(axis=1) won't work on recarray
    all_data = append_fields(data, 'total', tot, usemask=False)
    all_data = all_data.reshape(3,1)
    
    print("mylist = {}".format(mylist))
    print("data0 = {}".format(data0))
    print("data.shape = {}".format(data.shape))
    print("tot.shape = {}".format(tot.shape))
    print("all_data.shape = {}".format(all_data.shape))
    print("all_data.dtype.names = {}".format(all_data.dtype.names))
    print(all_data)
if __name__ == "__main__":
    main()
mylist = [(1, 2, 2), (2, 3, 3), (3, 5, 4)]
data0 = [(1., 2., 2.) (2., 3., 3.) (3., 5., 4.)]
data.shape = (3,)
tot.shape = (3,)
all_data.shape = (3, 1)
all_data.dtype.names = ('x', 'y', 'z', 'total')
[[(1., 2., 2.,  5.)]
 [(2., 3., 3.,  8.)]
 [(3., 5., 4., 12.)]]
