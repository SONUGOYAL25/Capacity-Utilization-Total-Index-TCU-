# Time Series Analysis and Forecasting: Capacity Utilization (1989–2024)

## 📊 Project Overview
This project focuses on **time series analysis and forecasting** of the *Total Industry Capacity Utilization Index* for the United States.  
The data was obtained from the [Federal Reserve Board (FRED)](https://fred.stlouisfed.org/series/TCU), covering **January 1989 – September 2024**.

The objective was to:
- Convert the dataset into a time series format
- Perform stationarity tests
- Fit AR, MA, and ARIMA models
- Evaluate model performance
- Forecast capacity utilization for the next 10 months

---

## 🧮 Data Description
- **Source:** Board of Governors of the Federal Reserve System (US)  
- **Frequency:** Monthly  
- **Units:** Percent (Seasonally Adjusted)  
- **Variables:**
  - `Date`
  - `Capacity Utilization`

---

## 🧠 Methods and Tests
The following steps were performed using **R**:

1. **Data Transformation:** Converted into a monthly time series  
2. **Visualization:** Line plot of capacity utilization  
3. **Stationarity Check:** Augmented Dickey-Fuller (ADF) test  
4. **Model Fitting:**  
   - Autoregressive (AR)
   - Moving Average (MA)
   - Auto ARIMA model  
5. **Residual Diagnostics:**  
   - ACF/PACF plots  
   - Durbin-Watson test  
   - Box-Pierce/Ljung-Box test  
   - QQ plot  
6. **Forecasting:** 10-month forecast with 90% and 95% confidence intervals

---

## 📈 Results Summary
- The time series was found to be **stationary**.
- The **AR(3)** model had the lowest AIC.
- The **MA(5)** model performed best under AIC and BIC criteria.
- The **Auto ARIMA** model was selected for forecasting.
- The residuals resembled white noise, confirming model adequacy.
- Forecasts indicated stable capacity utilization around **77.4%** for 2024–2025.

---

## 🧰 Tools Used
- **Language:** R  
- **Libraries:** `forecast`, `tseries`, `lmtest`  
- **Environment:** RStudio

---

## 📂 Repository Structure
