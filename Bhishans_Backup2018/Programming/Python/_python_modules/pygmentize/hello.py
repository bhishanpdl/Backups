#!python

import numpy as np
def main():
    A = np.random.random((4,4))
    Ainv = np.linalg.inv(A)

    print('A ', A)
    print('Ainv', Ainv)
    print('A*Ainv', np.dot(A,Ainv))

if __name__ == '__main__':
    main()
