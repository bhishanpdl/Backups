import matplotlib.pyplot as plt

x = [1,2,3]
y = [5,7,4]

plt.scatter(x,y, label='scatter',color='k',s=100,marker='x') 
#s=size
# marker choices are: , . - + x | < > v o d D h H * p s 0 to 9

plt.xlabel('x')
plt.ylabel('y')
plt.title('graph1')
plt.legend()
plt.show()

