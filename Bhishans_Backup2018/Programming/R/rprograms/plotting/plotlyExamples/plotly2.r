#!/usr/bin/Rscript

# Bhishan Poudel
# Jan 18, 2016

# ggplotly example
p <- ggplot(data = d, aes(x = carat, y = price)) +
  geom_point(aes(text = paste("Clarity:", clarity)), size = 4) +
  geom_smooth(aes(colour = cut, fill = cut)) + facet_wrap(~ cut)

(gg <- ggplotly(p))

print(gg)