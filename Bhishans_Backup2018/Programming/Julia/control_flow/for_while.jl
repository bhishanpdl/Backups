#!/usr/bin/env julia
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : oct 30, 2016
# Last update :
# Est time    :
#

#  While loop
i = 1
while true
         println(i)
         if i >= 5
           break
         end
         i += 1
       end


#  For loop
print("\n example of for\n")
for i = 1:1000
         println(i)
         if i >= 5
           break
         end
end

#  For loop and continue
print("\n example\n")
for i = 1:10
         if i % 3 != 0
           continue
         end
         println(i)
end


#  Multiple loops
print("\nmultiple loops\n")
for i = 1:2, j = 3:4
         println((i, j))
end

for i = 1:5
    print(i)
end
