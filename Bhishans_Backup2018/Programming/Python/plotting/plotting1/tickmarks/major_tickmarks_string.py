#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 24, 2016
# Ref     : https://stackoverflow.com/questions/12608788/changing-the-tick-frequency-on-x-or-y-axis-in-matplotlib

# Imports

# setting xticks in the interval of 1
import numpy as np
import matplotlib.pyplot as plt

x = [0,5,9,10,15]
y = [0,1,2,3,4]
plt.plot(x,y)
plt.xticks(np.arange(min(x), max(x)+1, 1.0))
plt.show()


# example 2
# xticks in the interval of 0.71
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker

x = [0,5,9,10,15]
y = [0,1,2,3,4]
fig, ax = plt.subplots()
ax.plot(x,y)
start, end = ax.get_xlim()
ax.xaxis.set_ticks(np.arange(start, end, 0.712123))
ax.xaxis.set_major_formatter(ticker.FormatStrFormatter('%0.1f'))
plt.show()


# example 3 (best)
import matplotlib.ticker as plticker

x = [0,5,9,10,15]
y = [0,1,2,3,4]
fig, ax = plt.subplots()


loc = plticker.MultipleLocator(base=2.0) # this locator puts ticks at regular intervals
ax.xaxis.set_major_locator(loc)

ax.plot(x,y)
plt.show()


# example 4
import matplotlib.pyplot as plt

x = [0,1,2,3,4,5]
y = [10,20,15,18,7,19]
xlabels = ['jan','feb','mar','apr','may','jun']

#Let's say that I want to show ticks labels only for 'feb' and 'jun'

xlabelsnew = []
for i in xlabels:
    if i not in ['feb','jun']:
        i = ' '
        xlabelsnew.append(i)
    else:
        xlabelsnew.append(i)

#Good, now we have a fake list of labels. First, we plotted the original version.

plt.plot(x,y)
plt.xticks(range(0,len(x)),xlabels,rotation=45)
plt.show()

# Now, the modified version.

plt.plot(x,y)
plt.xticks(range(0,len(x)),xlabelsnew,rotation=45)
plt.show()
