# 3.9 	示例：对数据集mtcars汇总统计
# 数据汇总统计
attach(mtcars)
colnames(mtcars)  # 变量重命名
aggregate(mtcars[, c(1, 3)], by = list(cyl, gear), FUN = mean)  # 数据汇总统计



# 3.9   	示例：使用melt()函数融合数据框和数组的数据
# 数据融合
library(reshape2)
# 作用于数据框的例子
head(airquality)  # 3.9 	示例：对数据集mtcars汇总统计
# 数据汇总统计
attach(mtcars)
colnames(mtcars)  # 变量重命名
aggregate(mtcars[, c(1, 3)], by = list(cyl, gear), FUN = mean)  # 数据汇总统计



# 3.9   	示例：使用melt()函数融合数据框和数组的数据
# 数据融合
library(reshape2)
#  作用于数据框的例子
head(airquality)
# 保留变量"Ozone", "Month", "Day"，其他的变量作为观测值，拉长数据框。
air_melt <- melt(airquality, id = c("Ozone", "Month", "Day"), na.rm = TRUE) 
head(air_melt)
# 作用于数组的例子
a <- array(c(1:11, NA), c(2, 3, 2)); a
a_melt <- melt(a, na.rm = TRUE, varnames = c("X", "Y", "Z"))  # 把高维数组a拉成一个数据框
head(a_melt)



# 3.9  	示例：数据重塑
# 数据重塑
# 分别求各月份Solar.R，Wind，Temp的平均值
air_cast <- dcast(air_melt, Month ~ variable, fun.aggregate = mean) 
air_cast




# 3.10  	示例：若a<0，result1 = 0，若0<a<1，result1 = 1，若a > 1，result1 = 2
#  if / else语句
a <- -1
if (a < 0)
  result <- 0 else if (a < 1) {
    result <- 1
  }  else
    result <- 2
result




# 3.10	示例：使用switch函数控制输出结果
#  switch语句
switch(2, mean(1:10), 1:5, 1:10)  # 输出第二个向量
y <- "fruit"
switch(y, fruit = "apple", vegetable = "broccoli", meat = "beef")  # 输出fruit对应的值



# 3.10  	示例：使用for语句循环输出2，5，10的平方根
# for循环
n <- c(2, 5, 10)
for (i in n) {
  x <- sqrt(i)  # 计算平方根
  cat("sqrt(", i, "): ", x, "\n")  # 输出每次循环的结果
}




# 3.10 	示例：使用while语句生成10个斐波那契数列
# while循环
x <- c(1, 1)
i <- 3
while (i <= 10) {  # 当i > 10时循环停止
  x[i] <- x[i - 1] + x[i - 2]  # 计算前两项的和
  i <- i + 1 } 
x



# 3.10  	示例：根据用户的点击数将用户分为“初级用户”，“中级用户”或“高级用户”
#  repeat - break循环
pv <- c(1, 1, 2, 3, 1, 1, 15, 7, 18)
i <- 1 
result <- ""
repeat{
  if (i > length(pv)) {  # 设置循环结束时的跳出语句
    break
  }
  if (pv[i] <= 5) { 
    result[i] <- "初级用户"  # 点击数小于等于5的用户为“初级用户”
  } else if (pv[i] <= 15) {
    result[i] <- "中级用户"  # 点击数大于5小于等于15的用户为“中级用户”
  } else {
    result[i] <- "高级用户"  # 点击数大于15的用户为“高级用户”
  }
  i <- i + 1
}
result



# 3.11    自编函数计算标准差代码
# 计算标准差
# 自编函数
sd2 <- function(x) {
  # 异常处理，当输入的数据不是数值类型时报错   
  if (!is.numeric(x)) {                          
    stop("the input data must be numeric!\n") 
  }                                            
  # 异常处理，当仅输入一个数据的时候，告知不能计算标准差
  if (length(x) == 1){                          
    stop("can not compute sd for one number, 
         a numeric vector required.\n")       
  }
  # 初始化一个临时向量，保存循环的结果，
  # 求每个值与平均值的平方  
  x2 <- c()
  # 求该向量的平均值 
  meanx <- mean(x)
  # 循环 
  for (i in 1:length(x)) {   
    xn <- x[i] - meanx  
    x2[i] <- xn ^ 2
  }
  # 求总平方和
  sum2 <- sum(x2)
  # 计算标准差
  sd <- sqrt(sum2 / (length(x) - 1))
  # 返回值
  return(sd)
}

# 程序的检验
# 正常的情况
sd2(c(2, 6, 4, 9, 12))
# 一个数值的情况
sd2(3)
# 输入数据不为数值类型时
sd2(c("1", "2"))
