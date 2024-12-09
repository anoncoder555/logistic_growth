## Script to plot both the observed data and predicted model ##

growth_data <- read.csv("experiment.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
} 
# This code sets up parameters of linear model

N0 <- exp(6.8941709) # Intercept = ln(N0) from linear model so to get N0 we use exp()

r <- 0.0100086

K <- 5.979e+10 

# Values extracted from the fit_linear_model.R code 

ggplot(aes(t, N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() +
  
  scale_y_continuous(trans='log10') +
  
  theme_minimal()

## Commit and push changes to github ##

# This ensures code saves the session information 
# to ensure code reproducibility 

sink(file = "package-versions.txt")
sessionInfo()
sink()


