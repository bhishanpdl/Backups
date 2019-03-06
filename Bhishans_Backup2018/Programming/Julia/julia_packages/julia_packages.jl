#!/usr/bin/env julia
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct 30, 2016 MOn
# Last update :
# Est time    :
#

#  installed packages
# print(Pkg.installed())

# Pycall
#Pkg.add("PyCall")
using PyCall
@pyimport math
a = math.sin(math.pi / 4) - sin(pi / 4)  # returns 0.0
print(a)

#  module Calculus
# Pkg.add("Calculus")
using Calculus
a = derivative(cos, 1.0)
print(a)

# Gadfly
#Pkg.add("Gadfly")
Pkg.add("RDatasets")
using Gadfly
using RDatasets

iris = dataset("datasets", "iris")
plot(data::DataFrame, mapping::Dict, elements::Element...)

# "DataFrames"
#Pkg.add("DataFrames" )


# Dict{String,VersionNumber} with 91 entries:
#   "Libz"                   => v"0.2.0"
#   "ForwardDiff"            => v"0.2.5"
#   "Coverage"               => v"0.3.2"
#   "Benchmark"              => v"0.1.0"
#   "ParameterizedFunctions" => v"0.2.0"
#   "InplaceOps"             => v"0.0.5"
#   "EllipsisNotation"       => v"0.0.2"
#   "LegacyStrings"          => v"0.1.1"
#   "ZMQ"                    => v"0.4.0"
#   "NullableArrays"         => v"0.0.10"
#   "DataStructures"         => v"0.4.6"
#   "ColorVectorSpace"       => v"0.1.11"
#   "ChunkedArrays"          => v"0.1.1"
#   "Compat"                 => v"0.9.3"
#   "CategoricalArrays"      => v"0.1.0"
#   "Calculus"               => v"0.1.15"
#   "GZip"                   => v"0.2.20"
#   "Clustering"             => v"0.7.0"
#   "Lint"                   => v"0.2.5"
#   "Measures"               => v"0.0.3"
#   "RecipesBase"            => v"0.1.0"
#   "Cairo"                  => v"0.2.35"
#   "HttpParser"             => v"0.2.0"
#   "DataFrames"             => v"0.8.4"
#   "Requests"               => v"0.3.11"
