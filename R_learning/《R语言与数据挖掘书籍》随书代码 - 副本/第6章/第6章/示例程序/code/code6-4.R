# 6.4      KNN算法预测客户是否流失
# KNN算法
setwd("F:/数据及程序/第6章/示例程序")  # 设置工作空间
Data <- read.csv("./data/telephone.csv")  # 读入数据
Data[, "流失"] <- as.factor(Data[, "流失"])  # 将目标变量转换成因子型
set.seed(1234)  # 设置随机种子

# 数据集随机抽70%定义为训练数据集，30%为测试数据集
ind <- sample(2, nrow(Data), replace = TRUE, prob = c(0.7, 0.3))
traindata <- Data[ind == 1, ]
testdata <- Data[ind == 2, ]

# 使用kknn函数建立knn分类模型 
library(kknn)  # 加载kknn包
# knn分类模型
kknn.model <- kknn(流失 ~ ., train = traindata, test = traindata, k = 5)  # 训练数据
kknn.model2 <- kknn(流失 ~ ., train = traindata, test = testdata, k = 5)  # 测试数据
summary(kknn.model)  # 输出模型概要
# 预测结果
train_predict <- predict(kknn.model)  # 训练数据
test_predict <- predict(kknn.model2)  # 测试数据
# 输出训练数据的混淆矩阵
(train_confusion <- table(actual = traindata$流失, predictedclass = train_predict)) 
# 输出测试数据的混淆矩阵
(test_confusion <- table(actual = testdata$流失, predictedclass = test_predict))

# 使用knn函数建立knn分类模型
library(class)  # 加载class包
# 建立knn分类模型
knn.model <- knn(traindata, testdata, cl = traindata[, "流失"]) 
# 输出测试数据的混淆矩阵
(test_confusion = table(actual = testdata$流失, predictedclass = knn.model))

# 使用train函数建立knn分类模型
library(caret)  # 加载caret包
# 建立knn分类模型
train.model <- train(traindata, traindata[, "流失"], method = "knn")
# 预测结果
train_predict <- predict(train.model, newdata = traindata)      #训练数据集
test_predict <- predict(train.model, newdata = testdata)       #测试数据集
# 输出训练数据的混淆矩阵
(train_confusion <- table(actual = traindata$流失, predictedclass = train_predict))
# 输出测试数据的混淆矩阵
(test_confusion <- table(actual = testdata$流失, predictedclass = test_predict))
