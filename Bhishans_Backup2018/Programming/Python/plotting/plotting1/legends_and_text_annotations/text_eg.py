#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 24, 2016
# Ref     : https://www.safaribooksonline.com/library/view/matplotlib-plotting-cookbook/9781849513265/ch03s05.html

# Imports
import numpy as np
import matplotlib.pyplot as plt
X = np.linspace(-4, 4, 1024)
Y = .25 * (X + 4.) * (X + 1.) * (X - 2.)

plt.text(-0.5, -0.25, 'Brackmard minimum')

plt.plot(X, Y, c = 'k')
plt.show()
