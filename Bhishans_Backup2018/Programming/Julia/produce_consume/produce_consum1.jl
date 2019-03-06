#!/usr/bin/env julia
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Nov 5, 2016
# Last update :
# Est time    :
#

function producer()
         produce("start")
         for n=1:4
           produce(2n)
         end
         produce("stop")
       end;


#  Task for producer
p =  Task(producer);
println(consume(p))


#  Using for loop
println("\n\nexample2")
for x in Task(producer)
         println(x)
end
