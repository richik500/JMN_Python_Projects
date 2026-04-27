# Time Series Forecasting using Regression Based Methods & Auto ARIMA (AirPassengers Dataset)

## 📌 Project Overview
This project demonstrates **Time Series Forecasting using Regression Based Methods** and **Auto ARIMA Modeling** using the built-in **AirPassengers** dataset in **R Programming**. The dataset contains monthly international airline passenger numbers from **1949 to 1960**, making it one of the most popular datasets for learning forecasting techniques.

The project includes trend analysis, stationarity testing, logarithmic transformation, differencing, ACF/PACF diagnostics, Auto ARIMA model selection, residual diagnostics, and forecasting future passenger counts.

## 🛠️ Tools & Technologies Used
- R Programming  
- Built-in R Dataset: `AirPassengers`  
- Libraries Used:
  - `tseries`
  - `forecast`

## 📂 Files Included
| File Name | Description |
|-----------|-------------|
| `AF_Class2_Air Passenger.R` | R script for complete forecasting analysis using AirPassengers dataset |

## 📊 Dataset Information
- Dataset Name: `AirPassengers`
- Frequency: Monthly
- Period: 1949 - 1960
- Total Observations: 144
- Data Type: Time Series

## 📈 Project Workflow

### 1️⃣ Load Dataset
The built-in AirPassengers dataset is loaded for forecasting analysis.

```r
data = AirPassengers
View(data)
plot(data)
dim(data)
````

### 2️⃣ Stationarity Testing

Two statistical tests are used:

* **ADF Test** → Checks if data is stationary
* **KPSS Test** → Confirms trend stationarity

```r
adf.test(data)
kpss.test(data)
```

Initial results indicate the series is **non-stationary** due to trend and seasonality.

### 3️⃣ Log Transformation

Variance instability is corrected using logarithmic scaling.

```r
log_data = log10(data)
plot(log_data)
```

This helps stabilize fluctuations over time.

### 4️⃣ ACF & PACF Analysis

Autocorrelation and Partial Autocorrelation plots are used to inspect lag relationships.

```r
acf(log_data)
pacf(log_data)
```

Observation:

* Series is not stationary
* Current values depend on many previous values

### 5️⃣ First Differencing

Trend is removed using first-order differencing.

```r
diff1 <- diff.default(log_data, differences = 1)
plot.ts(diff1)
```

### 6️⃣ Seasonal Differencing

Since the dataset is monthly, seasonal differencing of lag 12 is applied.

```r
diff2 <- diff.default(diff1, differences = 12)
plot(diff2)
```

This removes yearly seasonal patterns.

### 7️⃣ Auto ARIMA Model Selection

Best ARIMA model is selected automatically.

```r
auto_model = auto.arima(log_data)
summary(auto_model)
```

Auto ARIMA chooses the best `(p,d,q)(P,D,Q)` seasonal model based on AIC/BIC.

### 8️⃣ Manual ARIMA Model

```r
arima(diff2, order = c(1,0,1))
```

A manual ARIMA model is also tested for comparison.

### 9️⃣ Residual Diagnostics

Model errors are checked to ensure randomness.

```r
plot(auto_model$residuals)
tsdisplay(residuals(auto_model))
```

Good models should have white-noise residuals.

### 🔟 Forecasting Future Values

```r
forecast_value = forecast(auto_model, h = 12)
print(forecast_value)
```

Forecasts next **12 months** passenger values.

### 1️⃣1️⃣ Convert Forecast Back to Original Scale

```r
original_forecast = 10^(forecast_value$mean)
original_forecast
```

Since log transformation was applied, values are reconverted to actual passenger counts.

## 📊 Business Applications

* Airline Demand Forecasting
* Passenger Traffic Planning
* Revenue Estimation
* Capacity Management
* Seasonal Trend Forecasting
* Tourism Demand Analysis
* Transport Resource Allocation

## 🔍 Key Learnings

* Time Series Visualization
* ADF & KPSS Stationarity Testing
* Log Transformation
* Trend and Seasonal Differencing
* ACF & PACF Interpretation
* Auto ARIMA Forecasting
* Residual Diagnostics
* Reverse Transformation of Forecasts

## 💻 Sample Code

```r
library(tseries)
library(forecast)

data = AirPassengers
plot(data)

log_data = log10(data)

diff1 <- diff(log_data, 1)
diff2 <- diff(diff1, 12)

auto_model = auto.arima(log_data)

forecast(auto_model, h = 12)
```

## 🚀 Conclusion

This project provides complete hands-on exposure to **Time Series Forecasting** using the AirPassengers dataset. It demonstrates how raw seasonal data can be transformed, modeled, and forecasted using advanced ARIMA techniques for practical business decision-making.
