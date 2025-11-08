# Time Series Analysis and Forecasting: Capacity Utilization (1989–2024)

## 📊 Project Overview
This project focuses on **time series analysis and forecasting** of the *Total Industry Capacity Utilization Index* for the United States.  

---

##  Data Description
- **Source:** Board of Governors of the Federal Reserve System (US)  
- **Frequency:** Monthly  
- **Units:** Percent (Seasonally Adjusted)  
- **Variables:**
  - `Date`
  - `Capacity Utilization`

---

##  Methods and Tests

1. **Data Transformation:** Converted into a monthly time series  
2. **Visualization:** Time series plot of capacity utilization  
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

## Tools Used
- **Language:** R  
- **Libraries:** `forecast`, `tseries`, `lmtest`  
- **Environment:** RStudio

---
## Author
**Sonu Goyal**  
Integrated MSc Statistics
Central University of Rajasthan 

