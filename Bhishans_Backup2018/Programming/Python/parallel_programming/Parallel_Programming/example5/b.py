from multiprocessing import Process, Value, Array 
import numpy as np
import scipy


y_test = Array('d', np.zeros((10,10,4)).flat)

for i in range(r):
    npi = start[:,:,i] + i
    y_test[10*10*i:10*10*(i+1)] = npi.flatten()

resul = np.array(y_test).reshape((10,10,4), order = 'f')

print (resul)
