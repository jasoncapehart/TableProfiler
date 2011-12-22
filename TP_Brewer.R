library(tools)
library(brew)
setwd("//QL1WSSV3/USERS/JCapehart/Desktop/Tools Experiment/Table Profiler")

brew("TableProfileBrew.R", "TableProfileBrew.tex")
texi2dvi("TableProfileBrew.tex", pdf = TRUE)
