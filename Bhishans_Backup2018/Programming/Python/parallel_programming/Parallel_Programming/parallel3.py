#cmd: clear; unsetenv PYTHONHOME; unsetenv PYTHONPATH; python parallel3.py

# clear; python parallel3.py


import multiprocessing
import random

def worker(i):
    random.uniform(1,100000)
    print i,'done'


if __name__ == "__main__":
    for i in range(10):
        t = multiprocessing.Process(target = worker, args=(i,))
        t.start()
    print 'All the processes have been started.'
