#!/usr/bin/env julia
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct 31, 2016
# Last update :
# Ref : http://lectures.quantecon.org/jl/julia_libraries.html
#
using DataFrames

commodities = ["crude", "gas", "gold", "silver"]
last = @data([4.2, 11.3, 12.1, NA])  # Create DataArray
df = DataFrame(commod = commodities, price = last)
print(df)
print("\n")
print(df[:price])
print("\n")
print(df[:commod])
print("\n")
print(describe(df))

# df = readtable("data_file.csv")
writetable("data_file.csv", df)
