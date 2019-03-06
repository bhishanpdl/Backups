#!/usr/bin/env julia
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : oct 30,2016
# Last update :
# Est time    :
#

#  Shortcut operators || &&
function fact(n::Int)
           n >= 0 || error("n must be non-negative")
           n == 0 && return 1
           n * fact(n-1)
       end

a = fact(5)
print(a)
