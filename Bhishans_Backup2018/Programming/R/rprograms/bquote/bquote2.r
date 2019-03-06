labNames <- c('xLab','yLab')
squared <- c(expression('x'^2), expression('y'^2))

xlab <- eval(bquote(expression(.(labNames[1]) ~ .(squared[1][[1]]))))
ylab <- eval(bquote(expression(.(labNames[2]) ~ .(squared[2][[1]]))))

plot(c(1:10), xlab = xlab, ylab = ylab)