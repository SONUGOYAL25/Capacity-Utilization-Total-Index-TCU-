rm(list=ls())
install.packages("forecast")
library(forecast)
data=read.csv("C:/Users/ravyu/Downloads/Capacity_Utilization.csv")
data
ts_data=ts(data$Capacity.Utilization,start=c(1989,1),frequency=12)
ts_data

# Time Series plot 
plot(ts_data, col="darkblue")

# ACF plot
acf(ts_data,main="ACF PLOT")

# PACF plot
pacf(ts_data,main="PACF PLOT") 

# Stationary test

install.packages("tseries")
library(tseries)

adf_result=adf.test(ts_data);adf_result
if(adf_result$p.value<0.05)
{
cat("The time series is stationary(reject the null hypothesis).\n")
}else{
cat("The time series is non stationary(fail to reject the null hypothesis).\n")
}


# AR model

result1 = data.frame(Model = character(), AIC = numeric(), BIC = numeric(), Coefficients = I(list()))
for (lag in 1:5) 
{
 model_ar = arima(ts_data, order = c(lag, 0, 0))  # Fit AR model
 result1 = rbind(result1, data.frame(Model= "AR" ,AIC = AIC(model_ar),
 BIC = BIC(model_ar),
 Coefficients =I(list(coef(model_ar)))
    ))
 }
result1
best_aic_model = result1[which.min(result1$AIC), ];best_aic_model
best_bic_model = result1[which.min(result1$BIC), ];best_bic_model
write.csv(result1,file='result1.csv')


# MA model

result2 = data.frame(Model = character(), AIC = numeric(), BIC = numeric(), Coefficients = I(list()))
for (lag in 1:5) 
{
 model_ma = arima(ts_data, order = c(0, 0,lag))  # Fit MA model
 result2 = rbind(result2, data.frame(Model= "MA",AIC = AIC(model_ma),
 BIC = BIC(model_ma), Coefficients =I(list(coef(model_ma)))
    ))
 }
result2

best_aic_model = result2[which.min(result2$AIC), ]; best_aic_model
best_bic_model = result2[which.min(result2$BIC), ];best_bic_model

write.csv(result2,file='res2.csv')


# ARIMA model 

model <- auto.arima(ts_data)
summary(model) 
aic=AIC(model);aic
bic=BIC(model);bic
coefficients=I(list(coef(model)));coefficients
result=data.frame(AIC=aic,BIC=bic,Coefficients=coefficients);result
write.csv(result,file='arima')

# Residual Analysis 

residual_series=residuals(model)
plot(residual_series)
acf(residual_series,main="ACF PLOT FOR RESIDUAL SERIES")

# qq plot for residuals
qqnorm(residual_series)
qqline(residual_series,col="red")

# check for any significant correlation in residuals 

Box_test = Box.test(residual_series , lag = 10) ; Box_test
if (Box_test$p.value<0.05)
{
cat("There is significant autocorrelation in the residuals.\n")
}else{
cat("autocorrelation is not present in the residuals.\n")
}

# forecasting next 10 months

forecast_value=forecast(model,h=10,level=c(0.90,0.95))
forecast_value
plot(forecast_value)


