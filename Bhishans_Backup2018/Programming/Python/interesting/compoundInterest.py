#!/usr/bin/python

#compound interest

principal   = 900
rate        = 0.05
numyears    = 5

year = 1
while  year <= numyears:
    principal = principal * (1 + rate)

    #print ("%-4d %.2f" % (year, principal))
    print("{0:d} {1:-9.2f}".format(year,principal)) # Python 3
    year +=1

#conditionals

product = "game"
type    = "pirate memory"
age     = 26

if product == "game" and type == "pirate memory" \
                     and not (age < 4 or age > 8):         # backslash is used for readability
    print "\nI'll take it!"                                # we can not comment on same line of \
elif age == 25:
    print ("\nyou are too old to play games!")
else:
    print ("\nUnknown content type")
    #raise RuntimeError("Unknown content type")