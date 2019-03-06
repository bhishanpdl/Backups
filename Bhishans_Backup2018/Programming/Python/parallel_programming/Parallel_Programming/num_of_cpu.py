# clear; python num_of_cpu.py


# mehtod 1
import multiprocessing

print (multiprocessing.cpu_count())


# method 2
import psutil
print (psutil.cpu_count())
