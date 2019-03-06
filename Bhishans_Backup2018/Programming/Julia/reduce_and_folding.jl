#!/usr/bin/env julia
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : oct 30,2016
# Last update :
# Est time    :
#

#  example 1
a = reduce(+, 1:10)
#print(a)

#  example 2
l(a, b) = length(a) > length(b) ? a : b
print(l("string1","string2islonger"))
