#!/usr/bin/env julia
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : oct 30,2016
# Last update :
# Est time    :
#

#  function 1
f(x) = x * x
#print(f(2))

#  function 2
g(x, y) = sqrt(x^2 + y^2)
a = g(2,3)
#print(a)

#  fucntion 3
function xyzpos(x, y, z=0)
    println("$x, $y, $z")
    end

# a = xyzpos(2,3)
# print(a)


#  fucntion 4
function f(p, q ; r = 4, s = "hello")
  println("p is $p")
  println("q is $q")
  return "r => $r, s => $s"
end

a = f(2,3)
#print(a)

#  Functions with variable number of arguments
function fvar(args...)
    println("you supplied $(length(args)) arguments")
    for arg in args
       println(" argument ", arg)
    end
end

a = fvar(2,34,5)
#print(a)


#  anonymous function
a = map(x -> x^2 + 2x - 1, [1,3,-1])
b = map((x,y,z) -> x + y + z, [1,2,3], [4, 5, 6], [7, 8, 9])
#print(a, '\n', b)


# foreach
# foreach(println, 1:20)  # this is a BUG, it does not works.


# fucntion example
function check_longitude_1(loc)
         if -180 < loc < 180
             println("longitude $loc is a valid longitude")
         else
             println("longitude $loc should be between -180 and 180 degrees")
         end
       end
check_longitude_1(-182)

#  function example
