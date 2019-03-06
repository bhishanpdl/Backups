# Bhishan Poudel
# Nov 27, 2015 Fri

# clear; python eg1.py; rm *~

from astropy.io import ascii
import matplotlib.pylab as plt
 
tbl = ascii.read("simple_table.csv")
tbl.colnames  
print tbl['col1']
plt.plot(tbl['col1'], tbl['col2']
#plt.show()
