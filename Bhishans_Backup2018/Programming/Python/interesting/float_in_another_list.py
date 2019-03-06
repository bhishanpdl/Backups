#!/usr/bin/env python3
# Date: Mar 24, 2017
# Ref:
# https://stackoverflow.com/questions/25081644/check-between-which-floats-in-a-list-a-given-float-falls?rq=1

import numpy as np
import bisect

# GET INDEX from another ordered list JUST GREATER than element of GIVEN LIST.
# Ordered list.
a = [0.1, 0.3, 0.4, 0.5, 0.6, 0.7, 0.9]
# Not ordered list.
b = [0.12, 0.53, 0.30, 0.03, 0.77, 0.62, 0.98, 0.01, 0.42, 0.33, 1.3]

# Ordered list.
a = [0.1, 0.3, 0.4]
# Not ordered list.
b = [0.12, 0.3, 0.33, 1.3]


# method 1
indx = [bisect.bisect(a, x) for x in b]
print(indx)

# method 2
indx = np.searchsorted(a, b, side='right')
print(indx)


# method 3
aa = np.array(a)
bb = np.array(b)
indx = np.where(bb <= aa.max(), np.argmax((bb[:, None] - aa) < 0, axis=1), len(aa))
print(indx)

# method 4
indxs = []
for b_el in b:
    # Check if float is to the right of max(a)
    # b_el = 0.12 < max(a)
    if b_el > max(a):
        indxs.append(len(a))
        print('b_el = ', b_el)

    # b_el !< max(a) = 0.12
    # big loop, b_el = 0.12, small loop a_el varies
    # a_el = [0.1, 0.3, 0.4, 0.5, 0.6, 0.7, 0.9]
    # a_el > b_el NONE
    # a_el < b_el a.index(a_el)
    # a_el == b_el a.index(a_el) + 1
    # a_el should be GREATER than b_el or equal.
    # 0.1 ignore, 0.3 take index and break.
    # second big loop: b_el = 0.53
    else:
        for a_el in a:
            if b_el < a_el:
                print('b_el = ', b_el)
                print('a_el = ', a_el)
                print('a.index(a_el) = ', a.index(a_el))
                print("\n")
                indxs.append(a.index(a_el))
                break
            elif b_el == a_el:
                indxs.append(a.index(a_el) + 1)
                print('a_el = ', a_el)
                print('b_el = ', b_el)
                print('a.index(a_el) +1 = ', a.index(a_el) + 1)
                print("\n")
                break


print(indxs)
print(set(indxs))


#         0     1     2     3     4     5     6     7     8     9     10
# a    = [0.1,  0.3,  0.4,  0.5,  0.6,  0.7,  0.9]
# b    = [0.12, 0.53, 0.30, 0.03, 0.77, 0.62, 0.98, 0.01, 0.42, 0.33, 1.3]
# indx = [1,    4,    2,    0,    6,    5,    7,    0,    3,    2,    7]
# GET INDEX from another ordered list JUST GREATER than element of GIVEN LIST.
# look at elements of b and assign value from index of a.
# b should be SMALLER than a or equal.

# I have a list that looks like this:
#
#    # Ordered list.
#    a = [0.1, 0.3, 0.4, 0.5, 0.6, 0.7, 0.9]
#    I need to iterate through a list of floats that looks like this:
#
#        # Not ordered list.
#        b = [0.12, 0.53, 0.30, 0.03, 0.77, 0.62, 0.98, 0.01, 0.42, 0.33, 1.3]
#        check between which elements in list a each element in list b falls, and
#        return the index of the element in a (to the right). For example, for
#    the list b above the results would look like:
#
#        indxs = [1, 4, 2, 0, 6, 5, 7, 0, 3, 2, 7]
#        (notice the index 7 which points to an extra element in a associated to
#                > max(a))
#
#        I could do this with a rather elaborated for/if loop as shown below, but
#        I was wondering if there might be an easier way with some function I
#        might not be aware of (numpy/scipy functions are welcomed)
