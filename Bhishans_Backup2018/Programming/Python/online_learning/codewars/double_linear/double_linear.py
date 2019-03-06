#!/usr/bin/env python3
def dbl_linear(n):
    seq = [1]
    i = 0
    while i < n:
        x = seq[i]
        seq.append(2 * x + 1)
        seq.append(3 * x + 1)
        seq = list(set(seq))
        seq.sort()
        i += 1
    print(seq)
    return seq[n]


if __name__ == "__main__":
    print (dbl_linear(20))

# Consider a sequence u where u is defined as follows:
#
# The number u(0) = 1 is the first one in u.
# For each x in u, then y = 2 * x + 1 and z = 3 * x + 1
# must be in u too.
# There are no other numbers in u.
# Ex:
#     u = [1, 3, 4, 7, 9, 10, 13, 15, 19, 21, 22, 27, ...]
#
# 1 gives 3 and 4, then 3 gives 7 and 10, 4 gives 9 and 13,
# then 7 gives 15 and 22 and so on...
