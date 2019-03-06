#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 28, 2016
# Ref     : http://matplotlib.org/1.3.1/users/customizing.html
# Location: cd /bin/sh /tmp/geany_run_script_N6EYEY.sh/home/bhishan/OneDrive/Programming/Python/pyprograms/plotting/customizing_matplotlib/

# Imports
import matplotlib
import matplotlib.pyplot as plt

# To see library file
print('the file location is this:\n')
print(matplotlib.matplotlib_fname())

# Dynamic rc settings (rc means run command)
import matplotlib as mpl
mpl.rcParams['lines.linewidth'] = 2
mpl.rcParams['lines.color'] = 'r'

# I don't know why this does not work!
#plt.plot(range(10))
#plt.show()


# Use convenience functions for modifying rc settings
import matplotlib as mpl
mpl.rc('lines', linewidth=2, color='r')

# Restore the standard matplotlib default settings.
matplotlib.rcdefaults()
