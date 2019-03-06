#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct 04, 2016
# Last update :
#
# Ref: https://github.com/sympy/sympy/wiki/Quick-examples
#
# Imports
from __future__ import division, unicode_literals, print_function
from sympy import symbols,Function,solve,diff,integrate,dsolve,Eq,Derivative
from sympy import sin,cos,tan,pi


x, y, z, t = symbols('x y z t')
k, m, n = symbols('k m n', integer=True)

expr = x + 2*y
print('expr.args = ',expr.args)

##======================================================================
## expand
##======================================================================
a = ((x+y)**2 * (x+1)).expand()
print('\nexpand')
print(a)




##======================================================================
## simplify
##======================================================================
from sympy import sin,simplify
a = 1/x + (x*sin(x) - 1)/x
b = simplify(a)
print('\nsimplify')
print(b)




##======================================================================
## Solve a polynomial equation
##======================================================================
a = solve(x**3 + 2*x**2 + 4*x + 8, x)
print('\nsolve')
print(a)





##======================================================================
## solve system of equations
##======================================================================
ans = solve([x + 5*y - 2, -3*x + 6*y - 15], [x, y])
print('\nsystem of equations')
print(ans)


##======================================================================
## differentiate
##======================================================================
ans = diff(cos(x**2)**2 / (1+x), x)
print('\ndifferentiate')
print(ans)


##======================================================================
## integrate
##======================================================================
ans = integrate(x**2 * cos(x), x)
print('\nintegrate')
print(ans)

ans = integrate(x**2 * cos(x), (x, 0, pi/2))
print(ans)

##======================================================================
## Solve an ordinary differential equation
## solve: f'' + 9f = 1
##======================================================================
x = symbols(str('x'))
f, g = symbols(str('f g'), cls=Function)
ans = dsolve(Eq(Derivative(f(x),x,x) + 9*f(x), 1), f(x))
print('\nSolve an ordinary differential equation')
print(ans)
