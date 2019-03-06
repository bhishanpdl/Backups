#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 14, 2016

# ref: http://stackoverflow.com/questions/23852177/how-to-plot-3d-parametric-equations-in-r

library(lattice)
t<-seq(-2*pi, 2*pi, length.out=200)
print(cloud(z~x+y,data.frame(x=3*cos(t),y=3*sin(t), z=2*t)))

# example 2
t <- seq(0, 2*pi, length.out=50); 
u <- seq(0, 2*pi, length.out=50); 
tu<-expand.grid(t=t,u=u)
R <- 6; 
r <- 3; 
tu <- transform(tu, 
                x = cos(t)*(R+r*cos(u)), 
                y = sin(t)*(R+r*cos(u)),
                z = r*sin(u)
)

rr<-c(-10,10)
print(cloud(z~x+y, tu, xlim=rr, ylim=rr, zlim=rr, screen=list(y=20)))

# wireframe
xm<-outer(t,u,function(t, u)cos(t)*(R+r*cos(u)))
ym<-outer(t,u,function(t, u)sin(t)*(R+r*cos(u)))
zm<-outer(t,u,function(t, u) r*sin(u))

rr<-c(-10,10)
print(wireframe(zm~xm+ym, xlim=rr, ylim=rr, zlim=rr, screen=list(y=30)))