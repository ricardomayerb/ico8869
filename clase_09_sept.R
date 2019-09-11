library(fpp2)
# General id  ea: evaluate forecast accuracy:

# First example from the book
# Second, two series from BCCh

# Third, download a financial series using quantmod

# Review the measures and program by hand a hardcoded evaluation of
# Naive or season naive or trend naive against an auto.arima
# Introduce seasonal arima notation

# Then introduce the forecast package functions for accuracy


# Fourth, introduce time series cross validation

# Forecast errors: e_{T+h} = y_{T+h} - \hat{T+h|T}

# We can have as many forecast errors as we have observations in the test set

# MAE, mean(|e_t|)

beer2 <- window(ausbeer, start=1992, end=c(2007,4))
beer3 <-  window(ausbeer, start=c(2008,1))

length(beer2) # is 64
length(beer3) # is 10

autoplot(cbind(ausbeer, beer2, beer3), facets = TRUE)

beerfit1 <- meanf(beer2, h=10)
beerfit2 <- rwf(beer2, h=10)
beerfit3 <- snaive(beer2, h=10)
beerfit_arima <- auto.arima(beer2)

accuracy(beerfit1, beer3)

accuracy(beerfit2, beer3)
accuracy(beerfit3, beer3)


# let us reproduce MAE for meanf
str(beerfit1)
View(beerfit1)
beerfit1[["mean"]]
beer3
fe_fit1 <- beer3 - beerfit1$mean 
fe_fit1
mae_1 <- mean(abs(fe_fit1))
mae_1  

# let us reproduce RMSE for meanf
rmse_1 <- sqrt(mean(fe_fit1^2))
rmse_1

fe_fit1^2 %>% mean() %>% sqrt()

pfe_fit1 <- 100*fe_fit1/beer3 
pfe_fit1

# MAPE:
mape_1 <- pfe_fit1 %>% abs() %>% mean()
mape_1

# sMAPE:
smape_1 <- mean(200 * (beer3 - beerfit1$mean)/(beer3 + beerfit1$mean ))
smape_1


# MASE non-seasonal:
cbind(beer2, stats::lag(beer2, k= -1)) 
cbind(beer2, xts::lag.xts(beer2, k= 1))

diff_beer2_longer <- beer2 - stats::lag(beer2, k = -1)

diff_beer2 <- diff(beer2, lag = 1, differences = 1)

cbind(diff_beer2_longer, diff_beer2)

sum_ad_beer2 <- sum(abs(diff_beer2), na.rm = TRUE) 
sum_ad_beer2
this_T <- length(beer2)

denom <- (1/(this_T-1)) * sum_ad_beer2
denom

diff_beer2_season <- diff(beer2, lag = 4, differences = 1)
sum_ad_beer2_season <- sum(abs(diff_beer2_season), na.rm = TRUE) 
denom_season <- (1/(this_T-4)) * sum_ad_beer2_season
denom_season 

q_j_1 <- fe_fit1/denom
q_j_1

q_js_1_season <- fe_fit1/denom_season
q_js_1_season

# MASE
mase_1_non_season <- mean(abs(q_j_1))
mase_1 <- mean(abs(q_j_1_season))
mase_1_non_season
mase_1
accuracy(beerfit1, beer3)


# for fit 3
fe_fit3 <- beer3 - beerfit3$mean 
pfe_fit3 <- 100*fe_fit3/beer3 
q_j_3_season <- fe_fit3/denom_season

mae_3 <- mean(abs(fe_fit3))
rmse_3 <- sqrt(mean(fe_fit3^2))
mape_3 <- mean(abs(pfe_fit3)) 
mase_3 <- mean(abs(q_j_3_season))

mae_3
rmse_3
mape_3
mase_3




# arima 
fit_ari <- auto.arima(beer2)
fit_ari_2 <- auto.arima(beer2, approximation = FALSE)
fit_ari_3 <- auto.arima(beer2, stepwise = FALSE)
fit_ari_4 <- auto.arima(beer2, stepwise = FALSE, approximation = FALSE)
fit_ari
fit_ari_2
fit_ari_3
fit_ari_4
fc_ari <- forecast(fit_ari,h = 10)
fe_ari <- beer3 - fc_ari$mean
fe_ari

autoplot(window(ausbeer, start=1992)) +
  autolayer(beerfit1, series="Mean", PI=FALSE) +
  autolayer(beerfit2, series="Naïve", PI=FALSE) +
  autolayer(beerfit3, series="Seasonal naïve", PI=FALSE) +
  autolayer(fc_ari, series="arima", PI=FALSE) +
  xlab("Year") + ylab("Megalitres") +
  ggtitle("Forecasts for quarterly beer production") +
  guides(colour=guide_legend(title="Forecast"))

autoplot(window(ausbeer, start=1992)) +
  autolayer(beerfit3, series="Seasonal naïve", PI=FALSE) +
  autolayer(fc_ari, series="arima", PI=FALSE) +
  xlab("Year") + ylab("Megalitres") +
  ggtitle("Forecasts for quarterly beer production") +
  guides(colour=guide_legend(title="Forecast"))
