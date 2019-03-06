# clear; python eg1.py ; rm *~

# ref: http://kmdouglass.github.io/posts/learning-pythons-multiprocessing-module.html

import multiprocessing

def runSimulation(params):
    """This is the main processing function. It will contain whatever
    code should be run on multiple processors.

    """
    param1, param2 = params
    # Example computation
    processedData = []
    for ctr in range(10000):
	processedData.append(param1 * ctr - param2 ** 2)

    return processedData

if __name__ == '__main__':
    # Define the parameters to test
    param1 = range(100)
    param2 = range(2, 202, 2)

    # Zip the parameters because pool.map() takes only one iterable
    params = zip(param1, param2)

    pool = multiprocessing.Pool()
    results = pool.map(runSimulation, params)
