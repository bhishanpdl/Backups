#!usr/bin/env

# Bhishan Poudel
# Nov 27,2015 Fri

# clear; python eg1.py; rm *~
# clear; python eg1.py > output.txt; rm *~

from prettytable import PrettyTable

x = PrettyTable(["City name", "Area", "Population", "Annual Rainfall"])
x.align["City name"] = "l" # Left align city names
x.padding_width = 1 # One space between column edges and contents (default)
x.add_row(["Adelaide",1295, 1158259, 600.5])
x.add_row(["Brisbane",5905, 1857594, 1146.4])
x.add_row(["Darwin", 112, 120900, 1714.7])
x.add_row(["Hobart", 1357, 205556, 619.5])
x.add_row(["Sydney", 2058, 4336374, 1214.8])
x.add_row(["Melbourne", 1566, 3806092, 646.9])
x.add_row(["Perth", 5386, 1554769, 869.4])
print x

# Selecting subsets of data
print (x.get_string(fields=["City name", "Population"]))

# print only the first 3 rows of the table
print (x.get_string(start=0,end=3))

# sorting for printing
print x.get_string(sortby="Annual Rainfall")
print x.get_string(sortby="Annual Rainfall", reversesort=True)

# sorting for all
x.sortby = "Annual Rainfall"
x.sortby = None

# alignments
x.align["City name"] = "l"
x.align["Population"] = "c"
x.align["Area"] = "r"

# other setting
x.border = False
x.header = False
x.padding_width = 5
print x

# equivalent command: x = PrettyTable(border=False, header=False, padding_width=5)

