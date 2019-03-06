import os
import sys

import numpy as np
import matplotlib
matplotlib.use('TKAgg')
import matplotlib.pyplot as plt

def iter_files(root, prefix, ext='fits'):
    """This function iteratos over files under in `root`
    directory with given `prefix` and extension.
    """
    if os.path.isdir(root):
        for dirpath, dirnames, filenames in os.walk(root, followlinks=True):
            for filename in filenames:
                if filename.startswith(prefix) and filename.endswith('.'+ext):
                    yield os.path.join(dirpath, filename)
    else:
        filename = os.path.basename(root)
        if filename.startswith(prefix) and filename.endswith('.'+ext):
            yield root


#oudir = sys.argv[1]
oudir = 'inputs'
infiles = [x for x in iter_files(oudir, 'a', ext='txt')]

plt.figure()
delta = 1.0
#plt.xlim(3e3, 1e4)
#plt.ylim( 0., 35.)
for nm in infiles:
    x, y = np.loadtxt(nm, usecols=(0,1), unpack=True)
    #y /= 1.e-15
    plt.plot(x, y+delta, 'k', lw=0.2)
    delta += 0.7

plt.show()
