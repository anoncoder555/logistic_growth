## Script to estimate the model parameters using a linear approximation ##

# Load necessary packages #

# install.packages("dplyr")
library(dplyr)

growth_data <- read.csv("experiment.csv")

# Case 1. K > N0, t is small #

data_subset1 <- growth_data %>% filter(t< 1500) %>% mutate(N_log = log(N))
# Subset data such that t < 1500 
# t < 1500 subsets for the exponential growth rate phase

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)

# The output from this code run shows an intercept (ln(N0))
# (and so starting population size) of 6.8941709

# The rate of change with respect to t is 0.0100086 
# Hence growth rate (r) is 0.0100086

# Case 2. N(t) = K (at carrying capacity) #

data_subset2 <- growth_data %>% filter(t>2000)
# Subset data such that t > 2000 
# t > 2000  subsets for the stationary phase

model2 <- lm(N ~ 1, data_subset2)
summary(model2)

# The output of this model shows that the carrying capacity 
# of this population model is 5.979e+10


