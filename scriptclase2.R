library(fpp2)

y = ts(data = c(123,39,78,52,110), start = 2012)

View(melsyd)

melsyd[ , "Economy.Class"]

# economy es un ts objetc
economy <- melsyd[,"Economy.Class"]

autoplot(economy) +
  ggtitle("Economy class passengers: Melbourne-Sydney") +
  xlab("Year") +
  ylab("Thousands")

plot(melsyd[,"Economy.Class"])


autoplot(a10) +
  ggtitle("Antidiabetic drug sales") +
  ylab("$ million") +
  xlab("Year")