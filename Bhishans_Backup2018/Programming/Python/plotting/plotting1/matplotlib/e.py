import numpy as np
import matplotlib.pyplot as plt

x = []
y = []

readFile = open('example2.txt','r')
sepFile = readFile.read().split('\n')
readFile.close()

for plotPair in sepFile:
	xAndY = plotPair.split(',')
	x.append(int(xAndY[0]))
	y.append(int(xAndY[1]))
	

plt.plot(x,y)
plt.show() 
