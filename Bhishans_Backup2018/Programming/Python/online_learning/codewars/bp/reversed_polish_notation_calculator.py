#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-23-2016 Sun
# Last update :
#
#
def calc(expr):

    if expr == " " or expr=='' :
        return 0


    stack = []

    for val in expr.split(' '):
        if val in ['-', '+', '*', '/']:
            op1 = stack.pop()  # get last value and delete it from list
            op2 = stack.pop()
            if val=='-': result = op2 - op1
            if val=='+': result = op2 + op1
            if val=='*': result = op2 * op1
            if val=='/': result = op2 / op1
            stack.append(result)
        else:
            stack.append(float(val))

    return stack.pop()




##======================================================================
## method2
##======================================================================

def calc(expr):
    import operator
    OPERATORS = {'+': operator.add, '-': operator.sub, '*': operator.mul, '/': operator.truediv}
    stack = [0]
    for token in expr.split(" "):
        if token in OPERATORS:
            op2, op1 = stack.pop(), stack.pop()
            stack.append(OPERATORS[token](op1,op2))
        elif token:
            stack.append(float(token))
    return stack.pop()






##======================================================================
## method3
##======================================================================
import operator

def calc(expr):
    operators = {
        '+': operator.add,
        '-': operator.sub,
        '*': operator.mul,
        '/': operator.div,
        }
    stack = []
    for s in expr.split():
        op = operators.get(s)
        if op is not None:
            b, a = stack.pop(), stack.pop()
            stack.append(op(a, b))
        else:
            stack.append(float(s))
    return stack[-1] if stack else 0
