#!/usr/bin/env julia
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Nov 13, 2016
# Last update :
# Est time    :
#
using PyPlot
x = linspace(0, 10, 200)
y = sin(x)
fig, ax = subplots()
ax[:plot](x, y, "r-", linewidth=2, label="sine function", alpha=0.6)
ax[:legend](loc="upper center")
ax[:locator_params](axis ="y", nbins=4)
