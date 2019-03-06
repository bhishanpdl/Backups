#!/usr/bin/env julia
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : oct 30,2016
# Last update :
# Est time    :
#

#  function 1
function findodds{T<:Integer}(a::Array{T,1})
   find(isodd, a)
end

a = findodds(collect(1:20))
print(a)


#  simpler example
function findodds(a::Array{Int64,1})
   find(isodd, a)
end
a = findodds(collect(1:20))
print(a)
