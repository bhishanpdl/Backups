#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 14, 2016

# clear; Rscript writeLiness.r

# method 1
fileConn<-file("output.txt")
writeLines(c("Hello","World"), fileConn)
close(fileConn)


# method 2
sink("outfile.txt")
cat("hello")
cat("\n")
cat("world")
sink()

#file.show("outfile.txt")  # type q in terminal to quit


# method 3
cat("Hello",file="outfile.txt",sep="\n")
cat("World",file="outfile.txt",append=TRUE)

#file.show("outfile.txt")


# method 4
cat("hello","world",file="output.txt",sep="\n",append=TRUE)

# method 5
txt <- "Hallo\nWorld"
writeLines(txt, "outfile.txt")

# method 6
txt <- c("Hello", "World")
writeLines(txt, "outfile.txt")

# method 7
i <- 10 ;j <- 20 ;k <- 30
file.create("sample.txt")
fileConn <- file("sample.txt")
writeLines(c(paste(i, j, k, "07"),"1","41.6318 -87.0881 10.0"), fileConn)
close(fileConn)
file.show("sample.txt")


