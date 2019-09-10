library(tidyverse)
library(fpp2)

milk
autoplot(milk)

monthdays(milk)

milk/monthdays(milk)

dframe <- cbind(Monthly = milk,
                DailyAverage = milk/monthdays(milk))

autoplot(dframe, facets = TRUE) +
  xlab("Years") + ylab("Pounds") +
  ggtitle("Milk production per cow")

autoplot(elec)
autoplot(log(elec))
BoxCox.lambda(elec)

autoplot(BoxCox(elec, 0.265))



fc <- rwf(eggs, drift=TRUE, lambda=0, h=50, level=80)

fc2 <- rwf(eggs, drift=TRUE, lambda=0, h=50, level=80,
           biasadj=TRUE)

autoplot(eggs) +
  autolayer(fc, series="Simple back transformation") +
  autolayer(fc2, series="Bias adjusted", PI=FALSE) +
  guides(colour=guide_legend(title="Forecast"))


autoplot(ausbeer)

window(ausbeer, start=1995, end = c(2008, 2))

subset(ausbeer, start=length(ausbeer)-4*5)

subset(ausbeer, quarter = 1)
tail(ausbeer, 4*5)

beer2 <- window(ausbeer, start = 1992, end = c(2007, 4))
beer3 <- window(ausbeer, start = c(2008, 1))

beerfit1 <- meanf(beer2,h=10)
beerfit2 <- rwf(beer2,h=10)
beerfit3 <- snaive(beer2,h=10)

autoplot(window(ausbeer, start=1992)) +
  autolayer(beerfit1, series="Mean", PI=FALSE) +
  autolayer(beerfit2, series="Naïve", PI=FALSE) +
  autolayer(beerfit3, series="Seasonal naïve", PI=FALSE) +
  xlab("Year") + ylab("Megalitres") +
  ggtitle("Forecasts for quarterly beer production") +
  guides(colour=guide_legend(title="Forecast"))










