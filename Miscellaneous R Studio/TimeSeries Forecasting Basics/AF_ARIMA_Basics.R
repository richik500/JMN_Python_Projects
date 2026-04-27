# Attach the dataset so variables can be accessed directly
attach(staionary_Data)

# Load library for time series statistical tests
library(tseries)

# Load library for forecasting models and Auto ARIMA
library(forecast)

# Plot variable x as a line chart to observe trend and pattern
plot(staionary_Data$x, type="l")

# Plot variable y as a line chart to observe trend and fluctuations
plot(staionary_Data$y, type="l")

# Plot variable z as a line chart to observe movement over time
plot(staionary_Data$z, type="l")

# Store dataset into variable d for easier reference
d = staionary_Data

# Display Autocorrelation Function of x to check lag dependency
acf(d$x)

# Display Partial Autocorrelation Function of x
# Blue line indicates no significant correlation region
pacf(d$x)

# Display Autocorrelation Function of y
acf(d$y)

# Display Partial Autocorrelation Function of y
pacf(d$y)

# Display Autocorrelation Function of z
acf(d$z)

# Display Partial Autocorrelation Function of z
pacf(d$z)

# Set plotting area to show two graphs in one row
par(mfrow = c(1,2))

# Automatically identify best AR / MA / ARMA / ARIMA model for x
auto.arima(d$x)

# Build manual ARIMA model with order (2,0,0)
# ARIMA(2,0,0) means Auto Regression model with 2 lags
arima(d$x, order = c(2,0,0))
