Complete repository with a reproducible analysis of logistic growth data.

# Answers for reproducible-research_homework below:

## Q1: Annotate the README.md file in your logistic_growth repo with more detailed information about the analysis. Add a section on the results and include the estimates for N0, r and K (mention which *.csv file you used).

**Introduction:**

In this logistic growth analysis, I used the data "experiment.csv" which contained raw growth data of the bacteria _Escherichia coli_ grown in ambient conditions on growth media. The raw data recorded the population size (N) at regular time (t) intervals. 

**Methods:**

Section One:

In my first section (plot_data.R) I used the ggplot2 library to visualise the raw data. I first plotted the raw data of population size (N) on the y axis against time (t) on the x axis on a linear scale to observe the overall growth trend. This produces a sigmoidal curve where population starts low, grows expontentially then plauteaus at a carrying capacity, consistent with a logistic growth curve. Logistic growth curves have three main phases: the lag phase where the population is small and hence population growth is slow, the exponential growth phase which is a period of rapid growth and the saturation phase where growth rate descreases as the population reaches its carrying capacity. In a second plot I applied a logarithmic transformation to population size so that I had a semi-log plot (x axis linear and y axis log-transformed). This resulted in a plot within which the expontential growth phase could be visualised as a straight line, until a later point where population size leveled off and remained constant at the carrying capacity. 

Section Two:

In my next sextion (fit_linear_model.R) I estimated key parameters of the logistic growth model for the same data using a linear approximation. The key parameters were population size (*N<sub>0</sub>*), growth rate (*r*) and carrying capacity (*K*). I focused on two distinct stages of growth from the semi-log plot in section one: the exponential growth phase and the plateau phase. Using this plot I estimated the early growth phase where growth is exponential as *t<1500*. During exponential growth, *K* is much larger than *N<sub>0</sub>* and *t* is small. At this point the relationship between population size and time can be represented as *ln(N) = ln(N<sub>0</sub>) + rt*. Using only the exponential growth phase (t<1500), I fitted a linear model, *ln(N)~ t*, that returned estimates of starting population size as the intercept and growth rate (r). It is important to note that the value returned as starting population size is *ln(N<sub>0</sub>)* and hence to get the true value of *N<sub>0</sub>* we must run *exp(ln(N<sub>0</sub>))*. During the plateau phase, when *t > 2000*, the population has reached its carrying capacity and *N<sub>(t)</sub> = K*. Using a subset of the data, when *t>2000*, I fit another linear model such that *N ~ 1*, this estimates the value of *N* for this subset of data. This returned an estimated value of carrying capacity as *N<sub>(t)</sub> = K*.

Section Three:

In the final section (plot_data_and_model.R), I plotted the observed experimental data with the fitted logistic growth model to visualise how well this model expalins bacterial growth pattterns. I defined the logistic growth model then inputted the parameter estimates for *N<sub>0</sub>*, *r* and *K* I collected in section two. I used the ggplot2 library to create a plot with my logistic growth model (the red curve) overlayed on the experimental data plot.

**Results:**

From section two, I gained estimates of *N<sub>0</sub>*, *r* and *K* as follows.

*N<sub>0</sub>* = 986.5075

*r* = 0.0100086

*K* = 5.979e+10 

From section three, the plot of observed experimental data with the fitted logistic growth model showed that the model closely aligned with the data. This suggests that my estimated parameters effectively describe bacterial growth dynamics under the experimental conditions.

## Q2:  Use your estimates of *N<sub>0</sub>* and *r* to calculate the population size at *t = 4980 min*, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth?

**Working out:**
During exponential growth, K is much larger than *N<sub>0</sub>* and *t* is small. As we are assuming population growth is exponential, we can use the equation *N<sub>(t)</sub> = N<sub>0</sub>e<sup>rt</sup>*.

*N<sub>0</sub>* = 986.5075

*r* = 0.0100086

So... *N<sub>(t)</sub>* = 986.5075xe^(0.0100086x4980)

**Answer:**

*N<sub>(t)</sub>* = 4.370846e+24 
This is astronomically large and exceeds possible biological possibilty. This is expected under an assumption of exponential growth as there is no carrying capacity to limit the maximum population size.  




















