#!/usr/bin/env julia
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Nov 5, 2016
# Last update :
# Est time    :
#

using Iterators
using Primes


first20primes = [ 1 2 3 5 7 11 13 17 19]
for i in partition(first20primes, 3)
           @show i
end
