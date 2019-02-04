# 2.2.3  	示例：创建一个数组
# 创建数组
x <- c(1:30)
# 定义数组各维度的名称
dim1 <- c("A1", "A2", "A3")
dim2 <- c("B1", "B2", "B3", "B4", "B5")
dim3 <- c("C1", "c2")
# 创建数组，数组维数为3，各维度下标的最大值为3，5，2
(a <- array(x, dim = c(3, 5, 2), dimnames = list(dim1, dim2, dim3)))



# 2.2.3	示例：数组索引的几种方式
# 数组索引
# 示例数组
x <- c(1:30)
dim1 <- c("A1", "A2", "A3")
dim2 <- c("B1", "B2", "B3", "B4", "B5")
dim3 <- c("C1", "c2")
a <- array(x, dim = c(3, 5, 2), dimnames = list(dim1, dim2, dim3))
# 根据位置索引
a[2, 4, 1]
# 根据维度名称索引
a["A2", "B4", "C1"]
# 查看数组的维度
dim(a)



# 2.2.4	示例：创建数据框的几种方式
# 创建数据框
# 向量组成数据框
data_iris <- data.frame(Sepal.Length = c(5.1, 4.9, 4.7, 4.6), 
                        Sepal.Width = c(3.5, 3.0, 3.2, 3.1), 
                        Petal.Length = c(1.4, 1.4, 1.3, 1.5),
                        Pe.tal.Width = rep(0.2, 4))
data_iris
# 矩阵转化为数据框
(data_matrix <- matrix(1:8, c(4, 2)))  # 创建一个矩阵
(data.frame(data_matrix))  # 将矩阵转化为数据框



# 2.2.4          数据框索引
# 数据框索引
# 示例数据
data_iris <- data.frame(Sepal.Length = c(5.1, 4.9, 4.7, 4.6),
                        Sepal.Width = c(3.5, 3.0, 3.2, 3.1), 
                        Petal.Length = c(1.4, 1.4, 1.3, 1.5),
                        Pe.tal.Width = rep(0.2, 4))
# 列索引
data_iris[, 1]  # 索引第一列
data_iris$Sepal.Length  # 按列的名称索引
data_iris["Sepal.Length"]  # 按列的名称索引
# 行索引
data_iris[1, ]  # 索引第一行
data_iris[1:3, ]  # 索引第一至三行
# 元素索引
data_iris[1, 1]  # 索引第一列第一个元素
data_iris$Sepal.Length[1]  # 索引Sepal.Length列第一个元素
data_iris["Sepal.Length"][1]  # 索引Sepal.Length列第一个元素
# subset函数索引
subset(data_iris, Sepal.Length < 5)  # 按条件索引行  
# sqldf函数索引
library(sqldf)
newdf <- sqldf("select * from mtcars where carb = 1 order by mpg", row.names = TRUE)



# 2.2.4	示例：数据框的扩展、删减及列名的修改
# 数据框编辑
# 创建示例数据框
data_iris <- data.frame(Sepal.Length = c(5.1, 4.9, 4.7, 4.6), 
                        Sepal.Width = c(3.5, 3.0, 3.2, 3.1),
                        Petal.Length = c(1.4, 1.4, 1.3, 1.5), 
                        Pe.tal.Width = rep(0.2, 4))
data_iris
# 增加新的样本数据
(data_iris <- rbind(data_iris, list(5.0, 3.6, 1.4, 0.2)))
# 增加数据集的新属性变量
(data_iris <- cbind(data_iris, Species = rep("setosa", 5)))
# 数据框的删除
data_iris[, -1]  # 删除第一列
data_iris[-1, ]  # 删除第一行
# 数据框列名的编辑
names(data_iris)  # 查看数据框的列名
names(data_iris)[1] <- "sepal.length"  # 将数据框的第一列列名改为sepal.length
names(data_iris)  # 查看修改后数据框的列名

