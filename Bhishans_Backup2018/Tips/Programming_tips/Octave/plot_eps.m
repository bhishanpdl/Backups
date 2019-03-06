#!/usr/bin/octave -qf
% Author    : Bhishan Poudel
% Date      : May 28, 2016
% Ref       : https://lists.gnu.org/archive/html/help-octave/2013-05/msg00456.html

% install epstool to run this program without warning

x = -10:0.1:10;
figure (1);
plot(x, sin(x));
print -deps figure1.eps
