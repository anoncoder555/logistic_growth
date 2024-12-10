## Reproducible Research Assingment: Version Control and R

### Q1: Annotate the **README.md** file in your `logistic_growth` repo with more detailed information about the analysis. Add a section on the results and include the estimates for $N_0$, $r$ and $K$ (mention which *.csv file you used).

#### Introduction

In this analysis, I used the data "experiment.csv" which contained growth data of the bacteria *Escherichia coli* grown in ambient conditions on growth media. The bacteria were cultured in a test tube containing 900 μl of growth media and 100 μl of bacterial suspension. The dataset recorded the population size ($N$) at regular time ($t$) intervals. Using logistic growth analysis, this data was analysed to estimate three key parameters: intial population size ($N_0$), growth rate ($r$) and carrying capacity ($K$).

#### Methods

**Section One:** \
In my first section (`plot_data.R`) I used the ggplot library to visualise the raw data. The first plot showed population size ($N$) on the y axis and time ($t$) on the x axis on a linear scale to observe the overall growth trend. This produces a sigmoidal curve where population starts low, grows expontentially then plateaus at a carrying capacity, consistent with logistic growth. Logistic growth can be broadly divided into three stages: the lag phase, where growth is slow as intial population sizes are small, the exponential phase, where the population is larger and growth accelerates rapidly as resources are abundant, and the stationary phase, where growth slows as the population reaches the carrying capacity. 

 <p align="center">
     <img src="https://github.com/anoncoder555/logistic_growth/blob/main/plot1.png?raw=true" width="400" height="300" alt="Plot1">
  </p>

In a second plot I applied a logarithmic transformation to population size, creating a semi-log plot, with a linear x axis and log-transformed y axis. Within this plot the expontential growth phase can be visualised as a straight line, then at a later point population size levels off and remains constant at the carrying capacity.

 <p align="center">
     <img src="https://github.com/anoncoder555/logistic_growth/blob/main/plot2.png?raw=true" width="400" height="300" alt="Plot2">
  </p>

**Section Two:** \
In the second section (`fit_linear_model.R`), I applied a linear approximation to estimate the model parameters by focusing on two distinct stages of growth. 

1. *Exponential Growth Phase* \
In the first case where $K$ > $N_0$ and $t$ is small, we assume exponential growth, within which the population size is far from carrying capacity in the early growth phase. To capture this phase, time is filtered to $t$ < 1500. At this point the population size can be modelled using the exponential growth equation $N(t)$ = $N_0$ $e$<sup>rt</sup>. I took the natural logarithm to make this equation linear, $ln(N(t))$ = $ln(N_0)$ + $rt$. I could then fit a linear model to estimate the starting population size ( $ln(N_0)$ ) from the intercept and the growth rate ($r$) from the gradient. It is important to note that the intercept represents the value of $ln(N_0)$ so to determine $N_0$ I exponeniated the intercept.

2. *Stationary Phase* \
In the second case where $N(t)$ = $K$, I focused on where growth stabillises at the carrying capacity. This phase happens when $t$ is large so time is filtered to $t$ > 2000. When $t$ is large and the population size remains constant, the carrying capacity can be estimated as the population size during this phase. To achieve this, I fit a linear model $N$ ~ 1, where the intercept gives the value of the carrying capacity. 


**Section Three:** \
In the third section (`plot_data_and_model.R`), I visualised the growth data and overlaid the fitted logistic growth model to assess the alignment between the observed data and the prediction from my model. The parameters for the logistic growth function ($N_0$, $r$, $K$) were extracted from the linear approximations in Section Two. This visualisation allowed a direct comparison between the observed data (black points) and model prediction (red line). The model prediction aligned well with the observed data suggesting that population growth of this isolate of bacteria *Escherichia coli* follows a typical logistic growth pattern. 

<p align="center">
     <img src="https://github.com/anoncoder555/logistic_growth/blob/main/data_model_plot.png?raw=true" width="400" height="300" alt="Data & Model Plot">
  </p>

#### Results

From my analysis, I estimated the below values for intial population size ($N_0$), growth rate ($r$) and carrying capacity ($K$). \
$N_0$ = exp(6.8941709) = 986.5075 \
$r$ = 0.0100086 \
$K$ = 5.979 × 10<sup>10</sup> 


### Q2: Use your estimates of $N_0$ and $r$ to calculate the population size at $t$ = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth? 

**Population Size Under Exponential Growth:** \
To calculate the population size at $t$ = 4980 minutes under the assumption of exponential growth, I substituted my estimated values for $N_0$ and $r$ into the exponential growth equation: \
$N(t)$ = $N_0$ $e$<sup>rt</sup>. \
$N(t)$ = 986.5075 ⋅ $e$ <sup>0.0100086⋅4980</sup> \
$N(t)$ = **4.37 × 10<sup>24</sup>**

**Population Size Under Logistic Growth:** \
Under logistic growth, the population has reached its maximum size, as limited by carrying capacity, at $t$ = 4980 minutes. Therefore, the population size predicted under logistic growth at $t$ = 4980 minutes is equal to the carrying capacity. 

$N(t)$ = **5.979 × 10<sup>10</sup>** 

**Comparison of Population Sizes:** 

The population size predicted under exponential growth (4.37 × 10<sup>24</sup>) is vastly greater than the population size predicted under logistic growth (5.979 × 10<sup>10</sup>). The exponential growth population size is astronomically large, which is expected because exponential growth assumes the population grows without limit due to infinite resources in the absence of a carrying capacity. In contrast, the logistic growth population size is much smaller and more realistic. Under logistic growth, population size is limited by density-dependant factors, which cause population growth to slow as resources become scarce. Unlike exponential growth, logistic growth includes biological constraints that regulate population size as the population approaches its carrying capacity. Hence, logistic growth predictions are much more consistent with observed population dynamics.


### Q3: Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the **README.md** file so it can be viewed in the repo homepage.

The R code for this question can be found under the file named "compare_growth_curves.R" in my logistic growth repository. 
 <p align="center">
     <img src="https://github.com/anoncoder555/logistic_growth/blob/main/comparison_curves.png?raw=true" width="600" height="450" alt="Comparison Curves">
  </p>
  

