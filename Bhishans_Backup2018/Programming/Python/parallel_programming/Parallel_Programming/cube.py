# Bhishan Poudel
# Nov 11, 2015
# ref: http://sebastianraschka.com/Articles/2014_multiprocessing_intro.html

# cmd: clear; python3.5 cube.py


import multiprocessing as mp

def cube(x):
    return x**3
    
pool = mp.Pool(processes=4)
results = [pool.apply(cube, args=(x,)) for x in range(1,7)]
print(results)


pool = mp.Pool(processes=4)
results = pool.map(cube, range(1,7))
print(results)

pool = mp.Pool(processes=4)
results = [pool.apply_async(cube, args=(x,)) for x in range(1,7)]
output = [p.get() for p in results]
print(output)

