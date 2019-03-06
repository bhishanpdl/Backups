#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-12-2016 Wed
# Last update :
#
# Ref: http://www.yodiaditya.com/example-multiprocessing-in-python/
#
# Imports
from multiprocessing import Process, Queue
from multiprocessing.process import current_process


def arbitary_function(number):
    print "Executing number %s from %s" % (number, current_process().name)
    return True

def worker(worker_queue, result_queue):
    try:
        for number in iter(worker_queue.get, None):
            arbitary_function(number)
            result_queue.put("%s success with: %s" % (number,
                                                      current_process().name))
    except Exception, e:
        result_queue.put("%s failed with: %s" % (current_process().name,
                                                       e.message))


if __name__ == "__main__":
    numbers = [x for x in range(1000)]
    worker_queue = Queue()
    result_queue = Queue()

    for n in numbers:
        worker_queue.put(n)

    core_worker = 2
    workers = [Process(target=worker, args=(worker_queue, result_queue)) for i in range(core_worker)]

    for each in workers:
        each.start()


    for r in iter(results.get, None):
        print r
