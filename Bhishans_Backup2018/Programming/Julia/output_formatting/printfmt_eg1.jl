#!/usr/bin/env julia
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Nov 20, 2016
# Last update :
# Est time    :
#

# using packages
using Formatting: printfmt


# hw 11 3b To find pressure

# constants
k = 1.38064852e-23  # JK-1


function pressure(cloud::String,n::Number,T::Number)
    P =  n * k * T
    printfmt("Pressure for the cloud $cloud =  {:.3e}\n", P)

end

pressure("cnm", 30e6, 100)
pressure("wnm", 0.6e6, 5000)
pressure("him", 0.004e6, 7.5e5)
pressure("h2a", 1000e6, 10)
pressure("h2b", 1000_000e6, 50)
