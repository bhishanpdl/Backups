#!/usr/bin/env julia
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Nov 5, 2016
# Last update :
# Est time    :
#

x = 0

# test before the statements
while x < 4
    println(x)
    x += 1
end

#  If you want the condition to be tested after the statements,
#  rather than before, producing a "do .. until" form,
#  use the following construction:
x = 0
println("\nexample2")
while true
   println(x)
   x += 1
   x >= 4 && break
end
