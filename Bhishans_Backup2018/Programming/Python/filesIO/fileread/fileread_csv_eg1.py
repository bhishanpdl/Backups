import csv

with open('color.txt') as fin:
    reader = csv.reader(fin, delimiter=" ")
    col0 = list(zip(*reader))[0]
    
    
print(col0[0])
