library(fpp2)
# library(readxl)
# imacec_nm <- read_excel("Cuadro_1.xls", 
#                        sheet = "ExportCuadro",
#                        range = "A3:B81")
# pib <- read_excel("Cuadro_2.xls", 
#                         sheet = "ExportCuadro",
#                         range = "A3:B29")

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
  








