library(tseries)
library(forecast)
data= AirPassengers
View(data)
data=data.frame(data)
plot(data)
log10(data)
plot(log10(data))
par(mfrow=c(1,2))
acf(log10(data))
pacf(log10(data))
diff1 = diff(log10(data),differences = 12)
View(diff1)
plot(diff1)
par(mfrow=c(1,2))
acf(diff1)
pacf(diff1)
acf(diff1,lag.max = 50)

automodel= auto.arima(log10(data))
summary(automodel)          
automodel$residuals
forecast = forecast(automodel,h=12)
print(forecast)
original_forecast= 10^(forecast$mean)
original_forecast
#diagonistic checking of error
#residual plot
tsdisplay(residuals(automodel),main = "residual diagonistsics")