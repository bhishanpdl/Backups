#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 16, 2016

# set up a device driver to plot
postscript(file='~/Copy/Programming/R/rprograms/plotting/ggplot2Examples/subPaste1.eps')

library(ggplot2)
x_mean <- 1.5
x_sd <- 1.2
N <- 500

n <- ggplot(data.frame(x <- rnorm(N, x_mean, x_sd)),aes(x=x)) +
  geom_bar() + 
  stat_bin() +
  labs(title=substitute(paste(
    "Histogram of random data with ",
    mu,"=",m,", ",
    sigma^2,"=",s2,", ",
    "draws = ", numdraws,", ",
    bar(x),"=",xbar,", ",
    s^2,"=",sde),
    list(m=x_mean,xbar=mean(x),s2=x_sd^2,sde=var(x),numdraws=N)))

print(n)

# turn off device driver
dev.off()