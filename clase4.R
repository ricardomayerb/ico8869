# clase4
library(fpp2)

## Trend vs cycle vs season


## Seasonality
## recuerden: a10 is Monthly anti-diabetic drug sales in Australia from 1991 to 2008

autoplot(a10)

ggseasonplot(a10, year.labels = TRUE, year.labels.left = TRUE) +
  ylab("$ million") +
  ggtitle("Seasonal plot: antidiabetic drug sales")

ggseasonplot(a10, polar = TRUE) +
  ylab("$ million") +
  ggtitle("Polar seasonal plot: antidiabetic drug sales")


ggsubseriesplot(a10) +
  ylab("$ million") +
  ggtitle("Seasonal subseries plot: antidiabetic drug sales")


## scatterplot
autoplot(elecdemand[, c("Demand", "Temperature")], facets = TRUE) +
  xlab("Year: 2014") + ylab("") +
  ggtitle("Half-hourly electricity demand: Victoria, Australia")


qplot(Temperature, Demand, data=as.data.frame(elecdemand)) +
  ylab("Demand (GW)") + xlab("Temperature (Celsius)")


# btw: https://www.autodeskresearch.com/publications/samestats

autoplot(visnights[,1:5], facets=TRUE) +
  ylab("Number of visitor nights each quarter (millions)")

GGally::ggpairs(as.data.frame(visnights[,1:5]))



beer2 <- window(ausbeer, start = 1992)
autoplot(beer2)
gglagplot(beer2)

ggAcf(beer2)

aelec <- window(elec, start=1980)
autoplot(aelec) + xlab("Year") + ylab("GWh")

ggAcf(aelec, lag=48)

set.seed(30)
y <- ts(rnorm(50))
autoplot(y) + ggtitle("White noise")

ggAcf(y)



## FTB
# meanf(y, h)
# # y contains the time series
# # h is the forecast horizon
# naive(y, h)
# rwf(y, h) # Equivalent alternative
# snaive(y, h)
# rwf(y, h, drift=TRUE)

# Set training data from 1992 to 2007
beer2 <- window(ausbeer,start=1992,end=c(2007,4))
# Plot some forecasts
autoplot(beer2) +
  autolayer(meanf(beer2, h=11),
            series="Mean", PI=FALSE) +
  autolayer(naive(beer2, h=11),
            series="Naïve", PI=FALSE) +
  autolayer(snaive(beer2, h=11),
            series="Seasonal naïve", PI=FALSE) +
  ggtitle("Forecasts for quarterly beer production") +
  xlab("Year") + ylab("Megalitres") +
  guides(colour=guide_legend(title="Forecast"))


autoplot(goog200) +
  autolayer(meanf(goog200, h=40),
            series="Mean", PI=FALSE) +
  autolayer(rwf(goog200, h=40),
            series="Naïve", PI=FALSE) +
  autolayer(rwf(goog200, drift=TRUE, h=40),
            series="Drift", PI=FALSE) +
  ggtitle("Google stock (daily ending 6 Dec 2013)") +
  xlab("Day") + ylab("Closing Price (US$)") +
  guides(colour=guide_legend(title="Forecast"))
