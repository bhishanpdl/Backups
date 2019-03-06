#!/usr/bin/python

# Bhishan Poudel
# Nov 27, 2015 Fri
 
import numpy
import csv
from matplotlib import pyplot as plt
 
data=numpy.genfromtxt('SampleData.csv',skiprows=1,delimiter=',')
luminosity=data[:,1]; logL=numpy.log10(luminosity)
mass=data[:,0]
plt.plot(numpy.log10(luminosity),mass,'*',linewidth=0)
plt.title('M vs. L')
plt.xlabel('log(Luminosity) in some units...')
plt.ylabel(r'log(M$_{H_{2}}$) in some units...')
plt.show()
#plt.savefig('plottest1.png')
plt.clf()
 
mass=numpy.genfromtxt('SampleData2.csv',skiprows=1,delimiter=',',usecols=0)
logL=numpy.log10(numpy.genfromtxt('SampleData2.csv',skiprows=1,delimiter=',',usecols=2))
massmask=numpy.genfromtxt('SampleData2.csv',skiprows=1,delimiter=',',usecols=1,dtype=None)
limits=[]; regular=[]
for i in range(0,len(mass)):
    if massmask[i]=='"Yes"': limits.append([mass[i],logL[i]])
    else: regular.append([mass[i],logL[i]])
 
limits=numpy.array(limits).transpose()
regular=numpy.array(regular).transpose()
 
fig1=plt.figure(1)
sub1=fig1.add_subplot(2,1,1)
plt.plot(logL,mass,linewidth=0,marker='s',markersize=9,markerfacecolor='r',alpha=.5,markeredgecolor='b')
plt.title('Subplot 1 - Everything Together',fontsize=12)
plt.xlabel('log(Luminosity) ',fontsize=12)
plt.ylabel(r'log(M$_{H_{2}}$) ',fontsize=12)
 
sub2=fig1.add_subplot(2,1,2)
plt.errorbar(limits[1],limits[0],xerr=None,yerr=.15,fmt=None,ecolor='k',lolims=True,capsize=3,elinewidth=1,mew=0,label='Upper Lims')
plt.plot(regular[1],regular[0],linewidth=0,marker='d',markerfacecolor='g',alpha=.5,label='Exact Mass')
plt.title('Subplot 2 - Separated',fontsize=12)
plt.xlabel('log(Luminosity) ',fontsize=12)
plt.ylabel(r'log(M$_{H_{2}}$) ',fontsize=12)
 
plt.xlim(18,23); plt.ylim(6,10)
plt.legend(loc='upper left',prop={'size':8},numpoints=1)
fig1.suptitle('Mass vs. Luminosity',fontsize=16)
plt.subplots_adjust(left=.2,right=.8,bottom=.15,top=.85,hspace=.5)
plt.tick_params(axis='both',labelsize=10)
plt.rc('font',family='serif')
 
plt.show()
#plt.savefig('plottest2.png')
plt.clf()
