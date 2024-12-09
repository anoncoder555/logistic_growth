# Script to plot the logistic growth data
<<<<<<< HEAD
=======

# Import the dataset
>>>>>>> 280e0ad5ba9bf1d0afb9fe24df2011029dd3c5e7

growth_data <- read.csv("experiment.csv")

# install.packages("ggplot2")
library(ggplot2)

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw()

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +

  theme_bw() +
  
  scale_y_continuous(trans='log10')

