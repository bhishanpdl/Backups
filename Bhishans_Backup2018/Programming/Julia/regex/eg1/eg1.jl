#!/usr/bin/env julia
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Nov 14, 2016
# Last update :
# Est time    :
#

# split at 10th character
# Here we can use s"\1" as a replacement string to support capture groups.
# The trouble is that the special s"" string syntax doesn't support special
# characters like \n. You can get around this by manually constructing a
# SubstitutionString object, but then you need to escape the \ in \1

seq="MSKNKSPLLNESEKMMSEMLPMKVSQSKLNYEEKVYIPTTIRNRKQHCFRRFFPYIAL"
a = replace(seq, r"(.{10})", Base.SubstitutionString("\\1\n"))
println(a)

# fastest method
function intrapad(seq::String)
  buf = IOBuffer((length(seq)*11)>>3) # big enough buffer
  for i=1:10:length(seq)
    write(buf,SubString(seq,i,i+9),'\n')
  end
  return takebuf_string(buf)
end

# Speed comes from minimizing allocation using IOBuffer and SubStrings.
# Using BenchmarkTools package we have:
# julia> @benchmark intrapad(seq)

println(intrapad(seq))


# method 3
function join_substring(seq)
  a=join((SubString(seq,i,i+9) for i=1:10:length(seq)),'\n')
  println(a)
end
