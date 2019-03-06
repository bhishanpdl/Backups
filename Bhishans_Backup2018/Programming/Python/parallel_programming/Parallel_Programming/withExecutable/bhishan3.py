# clear; python bhishan3.py; rm *~

from multiprocessing import Process

def func1():
    print('func1: starting')
    print('this is line 1 of fn1')
    print('this is line 2 of fn1')
    print('this is line 3 of fn1')
    print('func1: finishing')
    print()
    print()

def func2():
  print('func2: starting')
  print('this is line 1 of fn2')
  print('this is line 2 of fn2')
  print('this is line 3 of fn2')
  print('func2: finishing')
  print()
  print() 
  
  
def func3():
  print('fun3: starting')
  print('this is line 1 of fn3')
  print('this is line 2 of fn3')
  print('this is line 3 of fn3')  
  print('func3: finishing')
  print() 
  print() 
  


def runInParallel(*fns):
  proc = []
  for fn in fns:
    p = Process(target=fn)
    p.start()
    proc.append(p)
  for p in proc:
    p.join()

if __name__ == '__main__':
  runInParallel(func1, func2,func3)
  

