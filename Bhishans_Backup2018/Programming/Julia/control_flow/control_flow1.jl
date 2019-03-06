#!/usr/bin/env julia
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : oct 30,2016
# Last update :
# Est time    :
#

#  Compound Expressions (begin and ; )
z = begin
         x = 1
         y = 2
         x + y
       end

print(z)

#  One liner
z = (x = 1; y = 2; x + y)
print('\n')
print(z)

#  Another one liner
z = begin x = 1; y = 2; x + y end
print("\n z= ", z)
