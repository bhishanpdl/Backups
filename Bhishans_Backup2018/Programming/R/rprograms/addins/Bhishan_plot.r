#' Insert some commands
#'
#' Call the function Bhishan at the cursor position.
#'
#' @export
Bhishan_plot <- function() {
rstudioapi::insertText("#!/usr/bin/Rscript \n")
rstudioapi::insertText("\n")
rstudioapi::insertText("# Author : Bhishan Poudel \n")
rstudioapi::insertText("# Date   : \n")
rstudioapi::insertText("# Program: \n\n")
rstudioapi::insertText("# Set the working directory  \n")
rstudioapi::insertText("this_dir <- function(directory) \n")
rstudioapi::insertText("setwd(file.path(getwd(), directory))  \n\n")
rstudioapi::insertText("# Start device driver to save output\n")
rstudioapi::insertText("#postscript(file= 'a.eps', height = 14, width = 8)\n\n\n\n")
rstudioapi::insertText("# Turn off device driver \n")
rstudioapi::insertText("#dev.off() \n")
}
