import matplotlib.pyplot as plt

x = []
y = []

readFile = open('SampleData.txt','r')
sepFile = readFile.read().split('\n')
readFile.close()

for plotPair in sepFile:
    xAndY = plotPair.split(',')
    print(xAndY)
    print(int(xAndY[0]))
    #x.append(int(xAndY[0]))
    #x.append(float(xAndY[0]))
    #y.append(int(xAndY[1]))

#plt.plot(x,y)
#plt.title('Matplotlib Graph')
#plt.xlabel('x axis label')
#plt.ylabel('y axis label')

#plt.show()
