# clear; python mpMap7.py ; rm *~

import itertools
from multiprocessing import Pool

def universal_worker(input_pair):
    function, args = input_pair
    return function(*args)

def pool_args(function, *args):
    return zip(itertools.repeat(function), zip(*args))
    
    
#pool = Pool(4)
#list_model = pool.map(universal_worker, pool_args(function, arg_0, arg_1)
#pool.close()
#pool.join()
