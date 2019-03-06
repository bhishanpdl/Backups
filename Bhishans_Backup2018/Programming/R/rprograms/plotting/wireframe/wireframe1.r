#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 8, 2016

# set the working directory
setwd("~/Copy/Programming/R/rprograms/plotting/wireframe/")

myseq<-seq(-3,3,length=100)
mygrid<-expand.grid(x1=myseq,x2=myseq)
mygrid$y<-dnorm(mygrid$x1)*dnorm(mygrid$x2)
require(lattice)
png(file="wireframe1.png", height = 450, width = 1100)
print(wireframe(y~x1*x2,
                data=mygrid,
                shade=TRUE,
                scales=list(arrows=FALSE,
                            x=list(draw=FALSE),
                            y=list(draw=FALSE),
                            z=list(draw=FALSE)
                ),
                aspect=c(1,1/3),
                xlab="",
                ylab="",
                zlab="",
                par.box = list(col=NA))
)
dev.off()