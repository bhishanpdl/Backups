import numpy as np # standard library imports - nothing special here
import matplotlib.pyplot as plt # same as above
 
a = np.arange(-6,10,0.1) # create an array having the numbers -6,-5.9,-5.8,...,-0.1,0,0.1,...,.9.8,9.9,10
 
def evalf(arg): # define function evalf to evaluate f(x) at x=x
 return arg**2 - 4*arg + 1
 
b = evalf(a)
 
fig = plt.figure() # hold the matplotlib in a  variable
sp = fig.add_subplot(111) # add a subplot to the figure - 111 means 1 row, 1 column, 1st subplot 1 is current
sp.grid('True') # enable the grid
plt.xlabel('value of x --&gt;') # labeling the x-axis
plt.ylabel('value of f(x) --&gt;') # labeling the y-axis
plt.title(r'$f(x) = x^2 - 4x + 1$') # giving the title - accepts &lt;a title=&quot;TeX wiki&quot; href=&quot;http://en.wikipedia.org/wiki/TeX&quot; target=&quot;_blank&quot;&gt;TeX&lt;/a&gt; also
 
myplot = sp.plot(a,b,'b') # hold the plot in a variable
myplot2 = sp.plot(2,evalf(2),'ro',3.732,evalf(3.732),'yo',0.268,evalf(0.268),'yo') # plotting critical points
sp.annotate('Minimum',(2,evalf(2)),xytext=(1.05,10),arrowprops=dict(facecolor='black', shrink=0.05))
sp.annotate('X-crossing 1',(0.268,evalf(0.268)),xytext=(-5,0),arrowprops=dict(facecolor='green', shrink=0.05))
sp.annotate('X-crossing 2',(3.732,evalf(3.732)),xytext=(6.5,0),arrowprops=dict(facecolor='green', shrink=0.05))
 
# annotation of all three points was achieved using the above three functions - text, point to be annotated, point for# text to be written and properties of the arrow mark used
 
plt.show() # after everything - just show the plot!
