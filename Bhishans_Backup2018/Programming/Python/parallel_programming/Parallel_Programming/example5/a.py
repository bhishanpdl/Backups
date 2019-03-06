# clear; python a.py; rm *~
# ref: https://stackoverflow.com/questions/34255749/multiple-processes-python-simple-loop-with-multidimensional-array



from multiprocessing import Process, Value, Array 
import numpy as np
import scipy


def process(a, i):
    npi = start[:,:, i] + i    # computes a numpy array
    a[10*10*i:10*10*(i+1)] = npi.flatten()  # stores it in shared memory

def main():
    y_test = Array('d', np.zeros((10,10,4)).flat) # initializes shared memory
    processes = []
    for i in range(4):  # uses 4 processes, one per each 10x10 array
        p = Process(target = process, args = (y_test, i))
        processes.append(p)
        p.start()
        print("Start", i, p.pid)  # to be sure the processes were started
    for i in range(4):
        p.join()        # join child processes
        print("Join", i, p.exitcode)
    resul = np.array(y_test).reshape((10,10,4), order='f') # rebuild the final numpy array
    print(resul)

if __name__ == '__main__':
    main()
