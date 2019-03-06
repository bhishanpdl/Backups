# cmd: python newprac.py midp.txt F3V range2.txt output.txt


import sys
import csv

w1 = []
w2 = []

fil1 = sys.argv[1]
fil2 = sys.argv[2]
textfile = sys.argv[4]

midf = open(fil1, 'r')
num = 0

col1 = []
col2 = []
for line in midf:
    part1 = line.split()
    val1 = part1[0]
    val2 = part1[1]
    col1.append(val1)
    col2.append(val2)
    num = num + 1
midf.close()

print num
print col2[num - 1]
lpoint = col2[num - 1]
col1.append(lpoint)

f1 = open(fil2, 'r')

k = 0
for lin2 in f1:
    if not lin2.startswith("#"):
        part2 = lin2.split()
        val2 = part2[0]
        flux2 = part2[1]
        w1.append(val2)
        w2.append(flux2)
        k = k + 1
        # print val2,k
# print w1
f1.close()

col3 = []

listf = []  # list for storing values
for x in range(0, num + 1):
    i = 0
    y = float(w1[0]) - float(col1[x])
    while (y < 0):
        i = i + 1
        y = y = float(w1[i]) - float(col1[x])
    print i, w1[i], col1[x]
    listf.append(i)
    a = float(w2[i]) - float(w2[i - 1])
    b = float(w1[i]) - float(w1[i - 1])
    slope = a / b                                       # y=mx+c in this equation we are finding the slope
    # print 'the slope is',slope
    dif1 = float(w2[i - 1]) * float(w1[i])
    dif2 = float(w2[i]) * float(w1[i - 1])
    dif = dif1 - dif2
    yintr = dif / b
    # print 'y intercept is',yintr
    y = (float(col1[x]) * float(slope)) + yintr
    col3.append(y)
    print col1[x], col3[x], x
# print listf,num
print col1, col2
print 'this is col3', col3
temp1 = []
temp2 = []
# loopval = 0
col1 = map(float, col1)
total = []
print ' total num is ', num, len(listf)
for xbar in range(0, 21):
    loopval = 0
    # loopf= listf[xbar+1]-listf[xbar]
    print 'in loop', listf[xbar], listf[xbar + 1], col1[xbar], col1[xbar + 1]
    temp1.append(col1[xbar])
    temp2.append(col3[xbar])
    print temp1
    for xbar2 in range(listf[xbar], listf[xbar + 1]):
        tempval = w1[xbar2]
        tempfval = w2[xbar2]
        temp1.append(tempval)
        temp2.append(tempfval)
        loopval = loopval + 1
    temp1.append(col1[xbar + 1])
    temp2.append(col3[xbar + 1])
    z = len(temp1)
    temp2 = map(float, temp2)
    temp1 = map(float, temp1)
    sum1 = 0
    for xbar3 in range(0, z - 1):
        # print temp1[xbar3],temp1[xbar3+1]
        wdif1 = (temp1[xbar3 + 1]) - (temp1[xbar3])
        pit = (temp2[xbar3 + 1] * temp1[xbar3 + 1]) + (temp2[xbar3] * temp1[xbar3])
        # print 'the val is', pit
        val1 = wdif1 * 0.5 * pit
        sum1 = sum1 + val1
        # print "Integration sum",sum1,xbar
    total.append(sum1)
    # print temp1[xbar3]
    # print 'the summation',sum1,xbar,col1[xbar],col2[xbar],temp1[z-1]
    del temp1[:]
    del temp2[:]
    # print temp1,temp2
print total, len(total)

file4 = sys.argv[3]

f4 = open(file4, 'r')

colps = []
colwv = []
for lin4 in f4:
    part4 = lin4.split()
    val4 = part4[0]
    wav4 = part4[1]
    colps.append(val4)
    colwv.append(wav4)
# print colps,colwv

with open(textfile, 'w') as fm:
    writer = csv.writer(fm, delimiter='\t')
    writer.writerows(zip(colps, colwv, total))
fm.close()
