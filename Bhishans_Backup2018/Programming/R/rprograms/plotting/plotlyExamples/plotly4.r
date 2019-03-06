library(plotly)
p <- ggplotly(username='bhishanpdl', key='amq1tpxuig')

zd <- matrix(rep(runif(38,0,38),26),26)

#random.sample(range(0, 41),41) for j in range(8)]
z <- tapply(z,(rep(1:nrow(z),ncol(z))),function(i)list(i))

cs <- list(
  c(0,"rgb(12,51,131)"),
  c(0.25,"rgb(10,136,186)"),
  c(0.5,"rgb(242,211,56)"),
  c(0.75,"rgb(242,143,56)"),
  c(1,"rgb(217,30,30)")
)

data <- list(
  z = zd,
  scl = cs,
  type = 'heatmap'
)

response <- p$ggplotly(data)

browseURL(response$url)