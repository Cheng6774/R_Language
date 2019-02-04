# 10.1.1 # as.ts()与is.ts()
Data <- read.csv("F:/数据及程序/第10章/示例程序/data/arima_data.csv", header = TRUE)[, 2]
is.ts(Data)
sales1 <- ts(Data)
is.ts(sales1)
sales2 <- as.ts(Data)
is.ts(sales2)



# 10.1.2  # 示例：时序图
plot.ts(sales1, xlab = "时间", ylab = "销量 / 元")



# 10.1.3  #  acf（）使用示例
acf(sales2, lag.max = 30)



# 10.1.3   # 单位根检验
library(fUnitRoots)
unitrootTest(sales1)



# 10.1.3   非平稳时间序列差分
difsales <- diff(sales1)
plot.ts(difsales, xlab = "时间", ylab = "销量残差 / 元")
acf(difsales, lag.max = 30)
unitrootTest(difsales)




# 10.1.4   # 一阶差分后序列的偏自相关图
pacf(difsales, lag.max = 30)



# 10.1.4   #  BIC图
library(TSA)
res <- armasubsets(y = difsales, nar = 5, nma = 5, y.name = 'test', ar.method = 'ols')
plot(res)



# 10.1.4   #  ARIMA模型
library(forecast)
arima <- Arima(sales1, order = c(1, 1, 0))
arima



# 10.1.4   # 白噪声检验
Box.test(arima$residuals, lag = 5, type = "Ljung-Box")



# 10.1.5   #模型预测
forecast <- forecast.Arima(arima, h = 5, level = c(80, 95))
forecast



# 10.1.5   # 绘制原始值与预测值图形
plot.forecast(forecast)



# 10.2.1   #  decompose()函数
sales <- ts(Data, start = c(2013, 1), frequency = 12)
sales.de <- decompose(sales, type = "additive")
sales.de
plot(sales.de)



# 10.2.1   #  stl()函数 
sales.stl <- stl(sales, s.window = "periodic")
sales.stl
plot(sales.stl)



# 10.2.2   #  HoltWinters()函数建模
hw.sales <- HoltWinters(sales, alpha = TRUE, beta = TRUE, gamma = TRUE)
hw.sales
rplot(hw.sales)



# 10.2.2 # 示例：建模并对模型的残差进行自相关检验与白噪声检验。
library(forecast)
hw.model <- forecast.HoltWinters(hw.sales, h = 6, level = c(80, 95))
hw.model
acf(hw.model$residuals)
Box.test(hw.model$residuals, lag = 10, type = 'Ljung-Box')




# 10.2.2 # 画出原始值与预测值的图形

plot(hw.model)
