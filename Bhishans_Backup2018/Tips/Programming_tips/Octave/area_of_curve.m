#!/usr/bin/octave -qf
% Author    : Bhishan Poudel
% Date      : May 28, 2016

pkg load symbolic
print(symbols)

x = sym("x");

f = inline("x^2*cos(x)");

ezplot(f, [-4,9])
print -deps graph.eps

[a, ierror, nfneval] = quad(f, -4, 9);

display('Area: '), disp(double(a));
pause;
