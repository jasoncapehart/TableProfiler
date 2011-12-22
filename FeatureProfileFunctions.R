# Feature Profile Functions

library(plyr)
library(ggplot2)
library(xtable)

#---------------
# Feature Histogram Function
#---------------

# Input: Data Frame
# Output: A list of histograms, 1 for each column in the data frame
# Required: ggplot2

feature.hist <- function(df) {
  require(ggplot2)
  
  cols <- dim(df)[2] 
  # Preallocate list
  hist.list <- list(NULL)
  length(hist.list) <- 3
 
  for (i in 1:cols) {
    col.name <- colnames(df)[i]
    hist.i <- ggplot(df, aes_string(x = col.name)) + 
           geom_histogram(aes(y=(..count../sum(..count..))*100)) +
           scale_y_continuous("Percentage") +
           opts(title = paste(col.name, "\n", sep = ''))
    hist.list[[i]] <- hist.i 
  }
  return(hist.list)
}

#---------------
# Descriptive Statistics Function
#---------------

# Input: data frame
# Output: a data frame with: average, med, min, max, range
# Required: plyr

descr.stats <- function(df) {
  require(plyr)
  
  basic.stat <- adply(df, .margins=2, .fun=each(max, min, colMeans))
  median.stat <- apply(df, MARGIN=2, FUN = median)
  descr.df <- data.frame("feature" = basic.stat[, 1]
                         , "max" = basic.stat$max
                         , "min" = basic.stat$min
                         , "mean" = basic.stat[, 4]
                         , "median" = median.stat
                         )
  rownames(descr.df) <- NULL

  return(descr.df)
}

#--------------
# Percentage of NAs Function
#--------------

# Input: data frame
# Output: A vector of percentages, 1 for each column in the data frame

na.pct <- function(df) {
  
  cols <- dim(df)[2]
  # Preallocate vector
  na.pct.vec <-  c(rep(NA, times = cols))
  
  for (i in 1:cols) {
    na.pct.i <- length(df[is.na(df[, 1]), 1])/length(df[, 1])
    na.pct.vec[i] <- na.pct.i 
  }
  return(na.pct.vec)
}





