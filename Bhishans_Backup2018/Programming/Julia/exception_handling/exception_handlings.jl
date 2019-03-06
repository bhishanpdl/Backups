#!/usr/bin/env julia
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : oct 30, 2016
# Last update :
# Est time    :
#

#  Simple function
f(x) = try
         sqrt(x)
       catch
         sqrt(complex(x, 0))
       end

print(f(1))
print("\nanother example\n")
print(f(-1))


#  Example 2
#  Calculate the square root of the second element of x if x is indexable,
#  otherwise assumes x is a real number and returns its square root:

sqrt_second(x) = try
         sqrt(x[2])
       catch y
         if isa(y, DomainError)
           sqrt(complex(x[2], 0))
         elseif isa(y, BoundsError)
           sqrt(x)
         end
       end
print("\n\nsqrt_second\n")
print(sqrt_second([1 4]))
print("\n")
print(sqrt_second([1 -4]))
print("\n")
print(sqrt_second(9))
