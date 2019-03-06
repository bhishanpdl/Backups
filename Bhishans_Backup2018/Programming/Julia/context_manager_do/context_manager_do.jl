#!/usr/bin/env julia
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Nov 5, 2016
# Last update :
# Est time    :
#
open("infile.txt", "r") do f
    @show readline(f)
end
