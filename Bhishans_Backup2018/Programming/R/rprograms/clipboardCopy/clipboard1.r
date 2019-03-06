

clipboard <- function(x, sep="\t", row.names=FALSE, col.names=TRUE){
  con <- pipe("xclip -selection clipboard -i", open="w")
  write.table(x, con, sep=sep, row.names=row.names, col.names=col.names)
  close(con)
}

vec <- c(1,2,3,4)

clipboard(vec)
clipboard(vec, ",", col.names=FALSE)
clipboard(vec, " ", row.names=TRUE)