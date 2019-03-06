#!/usr/bin/python

# topic: file read in
# cmd  : clear; python fileread.py


####################################################
# printing lines of a file
for line in open ("myfile.txt"):
     print line,

####################################################
# save lines of files into a list

#parsing filenames.txt file
f1 = open('foo.txt', 'r')
filenames_list = f1.readlines()
f1.close()

print 'first name is:', filenames_list[0]
####################################################

# example 1

array = []
with open("foo.txt", "r") as f:
  for line in f:
    array.append(line)


print array[0]

####################################################
# example 2

# If we want the \n included:
fname = 'foo.txt'
with open(fname) as f:
    content = f.readlines()
print content[1]

# If we do not want \n included:

with open(fname) as f:
    content = f.read().splitlines()
print content[2]


####################################################
# example 3
filename = 'foo.txt'
lines = tuple(open(filename, 'r'))
print lines[3]

####################################################
# example 4

lines = list(open("foo.txt", "r"))
linesSanitized = map(lambda each:each.strip("\n"), lines)
print linesSanitized

