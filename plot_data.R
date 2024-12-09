## Script to plot the logistic growth data ##

# Import the dataset

growth_data <- read.csv("experiment.csv")

# install.packages("ggplot2")
library(ggplot2)

# This code plots the untransformed data
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_minimal()

# This code plots the data with a log-transformed y axis
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +

  theme_bw() +
  
  scale_y_continuous(trans='log10') +
  
  theme_minimal()

