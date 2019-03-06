#' Insert some commands
#'
#' Call the function Bhishan at the cursor position.
#'
#' @export
Bhishan <- function() {
rstudioapi::insertText("#!/usr/bin/Rscript \n")
rstudioapi::insertText("# Author : Bhishan Poudel \n")
rstudioapi::insertText("# Date   : \n")
rstudioapi::insertText("# Program: \n\n")
rstudioapi::insertText("# Set the working directory  \n")
rstudioapi::insertText("this.dir <- dirname(parent.frame(2)$ofile) \n")
rstudioapi::insertText("setwd(this.dir) \n\n")
rstudioapi::insertText("# Libraries  \n")
}
