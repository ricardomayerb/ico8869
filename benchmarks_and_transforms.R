library(fpp2)


ausbeer

beer2 <- window(ausbeer,start=c(1992,1),end=c(2007,4))
autoplot(beer2)
meanf(beer2, h=11)

autoplot(beer2) + 
  autolayer( meanf(beer2, h=20),
             PI=FALSE, series = "media" ) + 
  autolayer(naive(beer2, h=20), 
            PI = FALSE, series = "naive") + 
  autolayer(snaive(beer2, h=20), 
            PI = FALSE, series = "snaive")

autoplot(goog200)
autoplot(beer2)








autoplot(goog200) +
  autolayer(meanf(goog200, h=40),
            series="Mean", PI=FALSE) +
  autolayer(rwf(goog200, h=40),
            series="Naïve", PI=FALSE) +
  autolayer(rwf(goog200, drift=TRUE, h=40),
            series="Drift", PI=FALSE) 
  


dframe <- cbind(Monthly = milk,
                DailyAverage = milk/monthdays(milk))

autoplot(dframe, facet=TRUE) +
  xlab("Years") + ylab("Pounds") +
  ggtitle("Milk production per cow")

lambda <- BoxCox.lambda(elec)
lambda

autoplot(elec)
autoplot(BoxCox(elec,lambda))


fc <- rwf(eggs, drift=TRUE, lambda=0, h=50, level=80)
fc2 <- rwf(eggs, drift=TRUE, lambda=0, h=50, level=80,
           biasadj=TRUE)
autoplot(eggs) +
  autolayer(fc, series="Simple back transformation") +
  autolayer(fc2, series="Bias adjusted", PI=FALSE) +
  guides(colour=guide_legend(title="Forecast"))

autoplot(goog200) +
  xlab("Day") + ylab("Closing Price (US$)") +
  ggtitle("Google Stock (daily ending 6 December 2013)")

res <- residuals(naive(goog200))

autoplot(res) + xlab("Day") + ylab("") +
  ggtitle("Residuals from naïve method")

gghistogram(res) + ggtitle("Histogram of residuals")

ggAcf(res) + ggtitle("ACF of residuals")


Box.test(res, lag=10, fitdf=0)

Box.test(res,lag=10, fitdf=0, type="Lj")


checkresiduals(naive(goog200))
