library(tseries)
library(forecast)
data= AirPassengers
View(data)
plot(data)
dim(data) #dimension of the data

cat("ADF Test p-value:", adf.test(data)$p.value, "\n")
cat("KPSS Test p-value:", kpss.test(data)$p.value, "\n")

log_data=log10(data)#Special type of scaling done
plot(log_data)

cat("ADF Test p-value:", adf.test(log_data)$p.value, "\n")
cat("KPSS Test p-value:", kpss.test(log_data)$p.value, "\n")

par(mfrow=c(1,2))
acf(log_data)
pacf(log_data)
# from the ACF and PACF plot we can see that the plot is not exponentially decreasing, can conclude that the series is not stationary
# Today's value is dependent of all the previous values.
diff1 <- diff.default(log_data, differences = 1)
plot.ts(diff1)

cat("ADF Test p-value:", adf.test(diff1)$p.value, "\n")
cat("KPSS Test p-value:", kpss.test(diff1)$p.value, "\n")

par(mfrow=c(1,2))
acf(diff1, lag.max = 50)
pacf(diff1)

diff2 <- diff.default(diff1, differences = 12)
plot(diff2)

cat("ADF Test p-value:", adf.test(diff2)$p.value, "\n")
cat("KPSS Test p-value:", kpss.test(diff2)$p.value, "\n")

par(mfrow=c(1,2))
acf(diff2, lag.max = 50)
pacf(diff2)

auto_model= auto.arima(log_data)
summary(auto_model)
auto_model$residuals
arima(diff2, order= c(1,0,1))

# For Checking of Error: Diagnostics Checking of Error
# Plot Residuals
plot(auto_model$residuals)
tsdisplay(residuals(auto_model), main="Residuals diagnostics")

forecast_value=forecast(auto_model,h=12)
print(forecast_value)

original_forecast=10^(forecast_value$mean)
original_forecast
