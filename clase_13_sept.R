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

fita <- auto.arima(beer2)
fca <- forecast(object = fita, h = 10)

arima_fc_errors <- beer3 - fca$mean
mae_arima <- mean(abs(arima_fc_errors))
mae_arima
rmse_arima <- sqrt(mean(arima_fc_errors^2))
rmse_arima 

diff(beer2, lag = 4)

cbind(beer2, lag(beer2, k = -4))


diff_beer2 <- diff(beer2, lag = 4, differences = 1)

denom <- mean(abs(diff_beer2))

q_arima <- arima_fc_errors/denom

mase_arima <- mean(abs(q_arima))

mae_arima
rmse_arima 
mase_arima

accuracy(fca)


cbind(arima_fc_errors, q_arima)

beer_01 <- window(ausbeer, start=1992, end=c(2005,4))
ari_01 <- auto.arima(beer_01)
fc_ari_01 <- forecast(ari_01, h=5)
fc_ari_01$mean
pred_ari_05 <- fc_ari_01$mean[5]
pred_ari_05
obs <- window(ausbeer, start=c(2007,1), end=c(2007,1))
fe_ari_01 <- obs - pred_ari_05
fe_ari_01

# para el segundo error con h=5
beer_02 <- window(ausbeer, start=1992, end=c(2006,1))
ari_02 <- auto.arima(beer_02)
fc_ari_02 <- forecast(ari_02, h=5)
fc_ari_02$mean
pred_ari_05 <- fc_ari_02$mean[5]
pred_ari_05
obs <- window(ausbeer, start=c(2007,2), end=c(2007,2))
fe_ari_02 <- obs - pred_ari_05
fe_ari_02
fe_ari_01
