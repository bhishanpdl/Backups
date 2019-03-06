# Bhishan Poudel
# Jan 7, 2016

#!/usr/bin/env Rscript

# clear; Rscript dollar_plot.r



d = read.table('dollar_vs_major_currencies_index.txt', header=F, sep="t", col.names=c("month", "index"))
dim(d)
