#!/usr/bin/Rscript
# Bhishan Poudel
# Jan 8, 2016

# clear; Rscript plot1.r


setwd("~/Copy/Programming/R/rprograms/plotting/r-bloggersPlots/")

n = 100
x = rnorm(n)
y = rnorm(n, x)

# plot 1
#png("fig1.png", width = 400, height = 300)
plot(x, y,
     xlab = "Explanatory Variable",
     ylab = "Outcome Variable",
     main = "plot1")
abline(lm(y~x), col = "red", lwd = 2)
#dev.off()

# plot2
plot(x, y, axes = F, xlab = NA, ylab = NA,main = "plot2")
abline(lm(y~x), col = "red", lwd = 2)


# plot3
plot(x, y, axes = F,
     xlab = NA,
     ylab = NA,
     main = "plot3")
abline(lm(y~x), col = "red", lwd = 2)
box()
axis(side = 1)
axis(side = 2)

# plot4
plot(x, y, axes = F,
     xlab = NA,
     ylab = NA,
     main = "plot4")
abline(lm(y~x), col = "red", lwd = 2)
box()
axis(side = 1)
axis(side = 2, las = 1)

# plot5
plot(x, y, axes = F,
     xlab = NA,
     ylab = NA,
     main = "plot5")
abline(lm(y~x), col = "red", lwd = 2)
box()
axis(side = 1, tck = -.01)
axis(side = 2, las = 1, tck = -.01)

# plot6
plot(x, y, axes = F,
     xlab = NA,
     ylab = NA,
     main = "plot6")
abline(lm(y~x), col = "red", lwd = 2)
box()
axis(side = 1, tck = -.015, labels = NA)
axis(side = 2, tck = -.015, labels = NA)
axis(side = 1, lwd = 0, line = -.4)
axis(side = 2, lwd = 0, line = -.4, las = 1)

# plot7
plot(x, y, axes = F,
     xlab = NA,
     ylab = NA,
     main = "plot7")
abline(lm(y~x), col = "red", lwd = 2)
box()
axis(side = 1, tck = -.015, labels = NA)
axis(side = 2, tck = -.015, labels = NA)
axis(side = 1, lwd = 0, line = -.4)
axis(side = 2, lwd = 0, line = -.4, las = 1)
mtext(side = 1, "Explanatory Variable", line = 2)
mtext(side = 2, "Outcome Variable", line = 2)




