attach(staionary_Data)
library(tseries)
library(forecast)
plot(x,type = 'l')
par(mfrow=c(1,2))
acf(x)
pacf(x)
auto.arima(x)
arima(x,order = c(2,0,0))

plot(y,type = 'l')
par(mfrow=c(1,2))
acf(y)
pacf(y)
auto.arima(y)
arima(y,order = c(0,0,2))
arima(y,order = c(3,0,0))

plot(z,type = 'l')
par(mfrow=c(1,2))
acf(z)
pacf(z)
auto.arima(z)
arima(z,order = c(2,0,3))


library(tseries)
library(forecast)
data=AirPassengers
data=data.frame(data)
View(data)
# mean increasing, variance constant
plot(data)
log10(data)
plot(log10(data))
par(mfrow=c(1,2))
acf(log10(data))
pacf(log10(data))
diff1=diff(log10(data),differences = 12)
plot(diff1)
par(mfrow=c(1,2))
acf(diff1,lag.max=50)
pacf(diff1, lag=50)
# arma ar ma for stationary series only
# after taking difference, 
auto_model=auto.arima(log10(data))
plot(auto_model)
summary(auto_model)
# order is abc, a is 0 (ar), b is 1 (i), c is 1 (ma)
#here seasonal is also there, so sarima (a,b,c)
# 12 
# AIC, AICC. which model has AIC lower, it is better. R 2 AND ADJUSTED R2

#ARIMA (0,1,1)(0,1,1){12}
#(p,d,q)(P,D,Q)
#p is how many auto regressive part will be there;
#d is indicating difference in order, when the series is non stationary - we change it to stationary using differencing - what shd be appropriate order for the differencing;
#q is indicating moving average order)
#1 step difference then apply arma
# (P,D,Q) is ar order of seasonal part and ar component
auto_model$residuals # e epsilon value

forecast_value=forecast(auto_model,h=12)
print(forecast_value)
original_forecast=10^(forecast_value$mean)
original_forecast

#Diagnostic Checking
#Residual Plot
tsdisplay(residuals(automodel),main = "residual diagnostics")
