# clear; python eg2.py ; rm *~

# ref: http://kmdouglass.github.io/posts/learning-pythons-multiprocessing-module.html

import multiprocessing

class simObject():
    def __init__(self, params):
	self.param1, self.param2 = params

def runSimulation(objInstance):
    """This is the main processing function. It will contain whatever
    code should be run on multiple processors.

    """
    param1, param2 = objInstance.param1, objInstance.param2
    # Example computation
    processedData = []
    for ctr in range(10000):
	processedData.append(param1 * ctr - param2 ** 2)

    return processedData

if __name__ == '__main__':
    # Define the parameters to test
    param1 = range(100)
    param2 = range(2, 202, 2)

    objList = []
    # Create a list of objects to feed into pool.map()
    for p1, p2 in zip(param1, param2):
	objList.append(simObject((p1, p2)))

    pool = multiprocessing.Pool()
    results = pool.map(runSimulation, objList)
