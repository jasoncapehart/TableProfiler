# Continuous Variable Example
#---------------------------
n <- 100
x1 <- runif(n, min = 0, max = 1)
x2 <- rnorm(n)
x3 <- rexp(n)
df <- data.frame("runif" = x1, "rnorm" = x2, "rexp" = x3)