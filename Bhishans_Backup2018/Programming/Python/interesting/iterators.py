for element in [1, 2, 3]:
    print element
print "\n"

for element in (1, 2, 3):
    print element
print "\n"

for char in "123":
    print char
print "\n"
# for int in {1,2,3}  # this doesnot work
#     print int

for key in {'one': 1, 'two': 2}:
    print key
print "\n"
for key in {'one', 'two'}:
    print key
print "\n"

for line in open("myfile.txt"):
    print line,
