# 7.1    K - Means聚类算法代码
# K - Means聚类
# 设置工作空间
setwd("F:/数据及程序/第7章/示例程序")
# 读入数据
Data <-  read.csv("./data/consumption_data.csv", header = TRUE)[, 2:4] 
# K - Means聚类分析建模，聚类个数为3
km <- kmeans(Data, center = 3)
# 查看聚类结果
print(km)
# 聚类后各类数据所占比例
km$size / sum(km$size)
# 将数据按聚类结果分组
Data.cluster <- data.frame(Data, km$cluster)
Data1 <- Data[which(Data.cluster$km.cluster == 1), ]
Data2 <- Data[which(Data.cluster$km.cluster == 2), ]
Data3 <- Data[which(Data.cluster$km.cluster == 3), ]
# 客户分群“1”的概率密度函数图
par(mfrow = c(1, 3))    
plot(density(Data1[, 1]), col = "red", main = "R")
plot(density(Data1[, 2]), col = "red", main = "F")
plot(density(Data1[, 3]), col = "red", main = "M")
# 客户分群“2”的概率密度函数图
par(mfrow = c(1, 3))    
plot(density(Data2[, 1]), col = "red", main = "R")
plot(density(Data2[, 2]), col = "red", main = "F")
plot(density(Data2[, 3]), col = "red", main = "M")
# 客户分群“3”的概率密度函数图
par(mfrow = c(1, 3))    
plot(density(Data3[, 1]), col = "red", main = "R")
plot(density(Data3[, 2]), col = "red", main = "F")
plot(density(Data3[, 3]), col = "red", main = "M")



# 7.2    hclust层次聚类算法代码
# 层次聚类
# 生成等差序列
n <- seq(1, 50, by = 4) 
# 对示例数据集USArrests进行等差抽样
(x <- USArrests[n, ]) 
# 聚类的合并方法为"complete"
hc1 <- hclust(dist(x), method = "complete")
# 将数据中心标准化后聚类
hc2 <- hclust(dist(scale(x)), method = "complete")
# 聚类的合并方法为"ave" 
hc3 <- hclust(dist(x), method = "ave")
# 查看聚类结果
print(hc1);print(hc2);print(hc3)
# 对聚类结果进行剪枝
# 利用剪枝函数cutree()中的参数k控制输出聚类结果
cutree(hc1, k = 4)
cutree(hc2, k = 4)
cutree(hc3, k = 4)
# 利用剪枝函数cutree()中的参数H控制输出聚类结果
cutree(hc1, h = 50)
cutree(hc2, h = 2)
cutree(hc3, h = 50)
# 绘制聚类树，并使用rect.hclust()在聚类树中查看聚类结果
# 分别绘制聚类树
plot(hc1)
plot(hc2)
plot(hc3)
# 用红色矩形框出4分类的聚类结果
rect.hclust(hc3, k = 4, border = "red")
# 用深灰色矩形框出高度指标为100时的聚类结果
rect.hclust(hc3, h = 100, border = "dark grey")



# 7.3  	示例：生成服从正态分布的随机数数据集，并对数据集进行K - 中心点聚类分析。
# K - 中心点聚类
# 加载函数包cluster
library(cluster)
# 设置随机种子
set.seed(0)
# 生成服从正态分布的随机数数据集
x <- rbind(cbind(rnorm(10, 0, 0.5), rnorm(10, 0, 0.5)), 
           cbind(rnorm(15, 5, 0.5), rnorm(15, 5, 0.5)))
# K - 中心点聚类
pamx <- pam(x, 2)  # 聚为2类
# 查看聚类结果              
print(pamx)
# 绘制聚类结果
plot(pamx)


# 7.3	示例：生成服从均匀分布，误差项服从正态分布的随机数数据集，并用密度聚类算法对数据集进行聚类。
# 密度聚类
# 加载函数fpc包
library(fpc)
# 设置随机种子
set.seed(665544)
# 示例数据
n <- 600
x <- cbind(runif(10, 0, 10) + rnorm(n, sd = 0.2), runif(10, 0, 10) + rnorm(n, sd = 0.2))
# 密度聚类
ds <- dbscan(x, 0.2)
# 查看聚类结果
print(ds)
# 绘制聚类结果
plot(ds, x)



# 7.3	示例：生成带有噪声的服从均匀分布的示例数据，并对数据做EM聚类分析。
# EM聚类
# 加载函数包mclust
library(mclust)
nNoise <- 100
set.seed(0)  # 设置随机种子
# 生成示例数据
Noise <- apply(faithful, 2, function(x) 
  runif(nNoise, min = min(x) - .1, max = max(x) + .1))
data <- rbind(faithful, Noise)
# 绘制示例数据散点图
plot(faithful)
points(Noise, pch = 20, cex = 0.5)
# EM聚类
set.seed(0)
NoiseInit <- sample(c(TRUE, FALSE), size = nrow(faithful) + nNoise, 
                   replace = TRUE, prob = c(3, 1) / 4)
mod5 <- Mclust(data, initialization = list(noise = NoiseInit))
# 查看模型建模结果
summary(mod5, parameter = TRUE)
# 绘制聚类结果的概率分布图
plot(mod5, what = "classification")

