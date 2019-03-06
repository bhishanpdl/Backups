#!/usr/bin/env julia
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : oct 30,2016
# Last update :
# Est time    :
#

#  Conditional Evaluation
# if 1  does not work ( 1 is integer, not boolean in Julia)
function test(x, y)
         if x < y
           println("$x is less than $y")
         elseif x > y
           println("$x is greater than $y")
         else
           println("$x is equal to $y")
         end
       end

# a = test(4,5)
# print(a)

#  Ternery operation
test(x, y) = println(x < y ? "$x is less than $y"    :
                     x > y ? "$x is greater than $y" : "$x is equal to $y")

a = test(4,5)
print(a)
