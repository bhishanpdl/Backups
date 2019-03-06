#!/usr/bin/env Rscript
# Author  : Bhishan Poudel
# Date    : Apr 09, 2016

# Libraries
library(ggplot2)

ggplot(meat, aes(date,beef)) +
  geom_line(colour='black') +
  scale_x_date(breaks=date_breaks('7 years'),labels = date_format("%b %Y")) +
  scale_y_continuous(labels=comma)
