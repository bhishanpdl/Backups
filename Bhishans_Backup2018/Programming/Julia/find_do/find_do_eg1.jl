#!/usr/bin/env julia
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Nov 5, 2016
# Last update :
# Est time    :
#

# find the index of the number
smallprimes = [1,2,3,5,7,11,13,17,19,23];
a = find(x -> x == 13, smallprimes)
print("\n a = ", a)

b = find(smallprimes) do x
       x == 13
    end

print("\n b = ", b)

# example2
mynums = [1 2 4 5]
c = find(x -> x ==4, mynums)
print("\n c = ", c)
