# 3.4	示例：放回简单随机抽样
# 放回简单随机抽样
library(sampling)
LETTERS
(s <- srswr(10, 26))  # 在26个字母中有放回地抽取10个样本
(obs <- ((1:26)[s != 0]) )  # 提取被抽到的样本单元的编号
(n <- s[s != 0])  # 提取每个样本被抽到的次数
(obs <- rep(obs, times = n))  # 被抽到的样本单元的编号按照抽到的次数重复。
(sample <- LETTERS[obs])



# 3.4	示例：不放回简单随机抽样
# 不放回简单随机抽样
library(sampling)
LETTERS
(s <- srswor(10, 26))  # 在20个样本中无放回地抽取5个样本
(obs <- ((1:26)[s != 0]) )  # 提取被抽到的样本单元的编号
(sample <- LETTERS[obs])



# 3.4	示例：用sample函数进行简单随机抽样
# 使用sample函数抽样
LETTERS
sample(LETTERS, 5, replace=TRUE)  # 放回简单随机抽样
sample(LETTERS, 5, replace=FALSE)  # 不放回简单随机抽样
# 生成随机分组结果，第一组和第二组比例为7:3
n <- sample(2, 26, replace = TRUE, prob = c(0.7, 0.3)) 
n
(sample1 <- LETTERS[n == 1])  # 第一组
(sample2 <- LETTERS[n == 2])  # 第二组



# 3.5  数学函数示例
# 数学函数示例
x <- c(1.12, -1.234, 3.1, 2.3, -4)
abs(x)  # 绝对值
sqrt(25)  # 平方根
ceiling(x)  # 不小于x的最小整数
floor(x)  # 不大于x的最大整数
round(x, digits = 1)  # 将x舍入为指定位的小数
signif(x, digits = 1)	# 将x舍入为指定的有效数字位数



# 3.5  统计函数示例
# 统计函数示例
mean(rivers)  # 平均值
median(rivers)  # 中位数
sd(rivers)  # 标准差
var(rivers)  # 方差
quantile(rivers, c(.3, .84))  #计算0.3和0.84的分位数
range(rivers)  # 值域
min(rivers)  # 最小值
max(rivers)  # 最大值
scale(cars, center = T, scale = F)  # 中心化
scale(cars, center = T, scale = T)  # 标准化
diff(cars[, 1])  # 滞后差分
# 求时间间隔
date <- c("2016-01-27", "2016-02-27")
difftime(date[2], date[1], units = "days")  # 时间间隔为天
difftime(date[2], date[1], units = "weeks")  # 时间间隔为周



# 3.5	示例：随机生成正态分布数据并求其密度和分位数
# 随机生成正态分布数据并求其密度和分位数。
data <- rnorm(20)  # 生成20个标准正态分布的数据
data
dnorm(data)  # 计算data中各个值对应标准正态分布的密度
pnorm(data)  # 计算data中各个值对应标准正态分布的分位数
qnorm(0.9, mean = 0, sd = 1)  # 计算标准正态分布的0.9分位数



# 3.6  字符串查询
# 字符串查询
txt <- c("Whatever", "is", "worth", "doing", "is", "worth", "doing", "well")
# grep()函数
grep("e.*r|wo", txt, fixed = FALSE)  # 查询含有"e...r"或"wo"的字符串，返回匹配项下标
# grepl()函数
grepl("e.*r|wo", txt)  # 返回一个逻辑向量，TRUE表示匹配
# gregexpr()函数
gregexpr("e.*r|wo", txt)  # 返回一个列表，结果包括匹配项的起始位置及匹配项长度
# regexec()函数
regexec("e.*r|wo", txt)  # 结果与gregexpr()函数相同
# regexpr()函数
regexpr("e.*r|wo", txt)  # 返回匹配项的起始位置及匹配项长度



# 3.6	示例：字符串替换
# 字符串替换
txt <- c("Whatever", "is", "worth", "doing", "is", "worth", "doing", "well")
sub("[tr]", "k", txt)  # 各分量第一个"t"或"r"替换为"k"
gsub("[tr]", "k", txt)  # 所有"t"和"r"替换为"k"



# 3.6 	示例：字符串拆分
# 字符串拆分
data <- c("2016年1月1日", "2016年2月1日")
strsplit(data, "年")  # 以"年"为分隔符拆分字符串，字符串拆分后以列表形式存储
strsplit(data, "年")[[1]][1]  # 提取列表中的元素



# 3.6 	示例：字符串连接
# 字符串连接
paste("AB", 1:5, sep = "")  # 将"AB"与向量1:5连接起来
x <- list(a = "1st", b = "2nd", c = "3rd")
y <- list(d = 1, e = 2)
paste(x, y, sep = "-")  # 用符号"-"连接x与y，较短的向量被循环使用
paste(x, y, sep = "-", collapse = "; ")  # 设置collapse参数，连成一个字符串
paste(x, collapse = ", ")  # 将x的各分量连接为一个字符串，符号",  "为各分量的分隔符


