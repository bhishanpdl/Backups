#!/usr/bin/env python3
# -*- coding: utf-8 -*-


def decompose(n):
    u"""Break n_square into longest increasing sum of squares upto n.

    e.g.
    decompose(11) ==> [1,2,4,10] since 11² = 1² + 2² + 4² + 10² not [2,6,9]
    decompose(50) ==> [1, 3, 5, 8, 49] but not [1, 1, 4, 9, 49].

    """
    from itertools import combinations
    from math import sqrt
    maxlist = []
    a = list(range(1, n + 1))   # [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    items = [x * x for x in a]  # [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

    for i in range(2, n - 1):
        for c in combinations(items, i):
            if sum(c) == n * n:
                mylist = [int(sqrt(x)) for x in c]
                m = max(mylist)
                maxlist = list(maxlist)
                maxlist.append(m)
                print(c, sum(c))
                print(mylist, m, '\n')
                print(maxlist, max(maxlist))
                if max(maxlist) in mylist:
                    ans = mylist

    return ans


if __name__ == "__main__":
    a = decompose(11)
    # print(a)

# My little sister came back home from school with the following task: given a
# squared sheet of paper she has to cut it in pieces which, when assembled,
# give squares the sides of which form an increasing sequence of numbers.
# At the beginning it was lot of fun but little by little we were tired of
# seeing the pile of torn paper. So we decided to write a program that could
# help us and protects trees.
#
# Task
#
# Given a positive integral number n, return a strictly increasing
# sequence (list/array/string depending on the language) of numbers,
# so that the sum of the squares is equal to n².
#
# If there are multiple solutions (and there will be),
# return the result with the largest possible values:
#
# Examples
#
# decompose(11) must return [1,2,4,10]. Note that there are actually two ways
# to decompose 11², 11² = 121 = 1 + 4 + 16 + 100 = 1² + 2² + 4² + 10²
# but don't return [2,6,9], since 9 is smaller than 10.
#
# For decompose(50) don't return [1, 1, 4, 9, 49] but [1, 3, 5, 8, 49]
# since [1, 1, 4, 9, 49] doesn't form a strictly increasing sequence.
#
# Note
#
# Neither [n] nor [1,1,1,…,1] are valid solutions. If no valid solution exists,
# return nil, null, Nothing, None (depending on the language) or ""
# (Java, C#) or {} (C++).
#
# The function "decompose" will take a positive integer n and return the
# decomposition of N = n² as:
#
# [x1 ... xk]
# Hint
#
# Very often xk will be n-1.
