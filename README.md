## Reproducible Research Assingment: Version Control and R

### Q1: Annotate the **README.md** file in your `logistic_growth` repo with more detailed information about the analysis. Add a section on the results and include the estimates for $N_0$, $r$ and $K$ (mention which *.csv file you used).

**Introduction**

In this analysis, I used the data "experiment.csv" which contained raw growth data of the bacteria *Escherichia coli* grown in ambient conditions on growth media. The bacteria was grown in a test tube with 900 μl of growth media and 100 μl of bacterial suspension. The raw data recorded the population size (N) at regular time (t) intervals. Using logistic growth analysis, this data was used to estimate the intial population size ($N_0$), growth rate ($r$) and carrying capacity ($K$).

**Methods** 

Section One:
In my first section (plot_data.R) I used the ggplot library to visualise the raw data. I first plotted the raw data of population size (N) on the y axis against time (t) on the x axis on a linear scale to observe the overall growth trend. This produces a sigmoidal curve where population starts low, grows expontentially then plateaus at a carrying capacity, consistent with logistic growth. Logistic growth can be broadly divided into three stages: the lag phase, where growth is slow as intial population sizes are small, the exponential phase, where growth accelerates rapidly as resources are abundant, and the stationary phase, where growth slows as the population reaches the carrying capacity. 

In a second plot I applied a logarithmic transformation to population size so that I had a semi-log plot (x axis linear and y axis log-transformed). This resulted in a plot within which the expontential growth phase could be visualised as a straight line, until a later point where population size leveled off and remained constant.


Section Two:

Section Three:

**Results**

From my analysis, I got values of...

### Q2 Use your estimates of $N_0$ and $r$ to calculate the population size at $t$ = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth? 



### Q3 Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the **README.md** file so it can be viewed in the repo homepage.

The R code for this question can be found under the file named "compare_growth_curves.R" in my logistic growth repository. 

https://github.com/anoncoder555/logistic_growth/blob/main/comparison_curves.png?raw=true
