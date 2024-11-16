#Script to plot data and model

growth_data <- read.csv("experiment.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
} # sets up paramters of linear model

N0 <- exp(6.8941709) # Intecept / ln(N0) from linear model so to get N0 we use exp()

r <- 0.0100086

K <- 5.979e+10 # Values extracted from the fit_linear_model.R code 

ggplot(aes(t, N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() +
  
  scale_y_continuous(trans='log10')

## Commit and push changes to github ##

sink(file = "package-versions.txt")
sessionInfo()
sink()




