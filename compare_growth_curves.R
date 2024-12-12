## Script to plot a comparison curve of exponential and logistic growth ##

# Load necessary packages 

library(ggplot2)

# Create a function for logistic growth 
  
logistic_growth <- function(t, N0, K, r) {
 N <- (N0*K*exp(r*t)) / (K - N0 + N0*exp(r*t))
 return(N)
}

# Create a function for exponential growth 

exp_growth <- function(t, N0, r) {
  N<- (N0*exp(r*t))
  return(N)
}

# Set parameters for growth curves (from previous analysis)
t <- seq(0, 4980, by = 60)
N0 <- exp(6.8941709) 
K <- 5.979e+10
r <- 0.0100086

# Work out populations with parameters

logistic_growth_size <- logistic_growth(t, N0, K, r)
exp_growth_size <- exp_growth(t, N0, r)

# Create a data frame for plotting

growth_data <- data.frame(
  Time = t,
  Logistic = logistic_growth_size,
  Exponential = exp_growth_size
)

# Plot growth curves 

ggplot(growth_data, aes(x=Time)) +
  geom_line(aes(y = Logistic, color = "Logistic"), linewidth = 0.8) +
  geom_line(aes(y = Exponential, color = "Exponential"), linewidth = 0.8) +
  scale_y_continuous(trans = 'log10') +
  labs(
    title = "Comparison of Exponential and Logistic Growth Curves",
    x = "Time (minutes)",
    y = "Population size (log scale)"
  ) +
  scale_color_manual(
    name = "Growth Curve:",
    values = c("Logistic" = "maroon", "Exponential" = "navy")
  ) +
  theme_minimal() +
  theme(
 plot.title = element_text(
   face = "bold",        
   size = 13,
   hjust = 0.2),
 axis.title = element_text(
   hjust = 0.5,        
   size = 11),
 axis.text = element_text(
   size = 9),
 legend.title = element_text(
   size = 11,
   face = "bold"),
  )








