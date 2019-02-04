# 6.6    建立lda模型并进行分类预测
# lda模型
setwd("F:/数据及程序/第6章/示例程序")  # 设置工作空间
Data <- read.csv("./data/telephone.csv")  # 读入数据
Data[, "流失"] <- as.factor(Data[, "流失"]) #将目标变量转换成因子型
set.seed(1234)  # 设置随机种子
# 数据集随机抽70%定义为训练数据集，30%为测试数据集

ind <- sample(2, nrow(Data), replace = TRUE, prob = c(0.7, 0.3))
traindata <- Data[ind == 1, ]
testdata <- Data[ind == 2, ]

# 建立lda分类模型
library(MASS)
lda.model <- lda(流失 ~ ., data = traindata)

# 预测结果
train_predict <- predict(lda.model, newdata = traindata)  # 训练数据集
test_predict <- predict(lda.model, newdata = testdata)  # 测试数据集

# 输出训练数据的分类结果
train_predictdata <- cbind(traindata, predictedclass = train_predict$class) 
# 输出训练数据的混淆矩阵
(train_confusion <- table(actual = traindata$流失, predictedclass = train_predict$class))
# 输出测试数据的分类结果
test_predictdata <- cbind(testdata, predictedclass = test_predict$class)
# 输出测试数据的混淆矩阵
(test_confusion <- table(actual = testdata$流失, predictedclass = test_predict$class))



# 6.6    构建rpart模型并进行分类预测
# rpart模型
setwd("F:/数据及程序/第6章/示例程序")  # 设置工作空间
Data <- read.csv("./data/telephone.csv")  # 读入数据
Data[, "流失"] <- as.factor(Data[, "流失"])  # 将目标变量转换成因子型
set.seed(1234)  # 设置随机种子
# 数据集随机抽70%定义为训练数据集，30%为测试数据集
ind <- sample(2, nrow(Data), replace = TRUE, prob = c(0.7, 0.3))
traindata <- Data[ind == 1, ]
testdata <- Data[ind == 2, ]

# 建立rpart分类模型
library(rpart)
library(rpart.plot)
rpart.model <- rpart(流失 ~ ., data = traindata, method = "class", cp = 0.03)  # cp为复杂的参数
# 输出决策树图
rpart.plot(rpart.model, branch = 1, branch.type = 2, type = 1, extra = 102,  
           border.col = "blue", split.col = "red",  
           split.cex = 1, main = "客户流失决策树")
# 预测结果
train_predict <- predict(rpart.model, newdata = traindata, type = "class")  # 训练数据集
test_predict <- predict(rpart.model, newdata = testdata, type = "class")  # 测试数据集

# 输出训练数据的分类结果
train_predictdata <- cbind(traindata, predictedclass = train_predict) 
# 输出训练数据的混淆矩阵
(train_confusion <- table(actual = traindata$流失, predictedclass = train_predict)) 
# 输出测试数据的分类结果
test_predictdata <- cbind(testdata, predictedclass = test_predict)
# 输出测试数据的混淆矩阵
(test_confusion <- table(actual = testdata$流失, predictedclass = test_predict))



# 6.6   构建bagging模型并进行分类预测
# bagging模型
setwd("F:/数据及程序/第6章/示例程序")  # 设置工作空间
Data <- read.csv("./data/telephone.csv")  # 读入数据
Data[, "流失"] <- as.factor(Data[, "流失"])  # 将目标变量转换成因子型
set.seed(1234)  # 设置随机种子
# 数据集随机抽70%定义为训练数据集，30%为测试数据集
ind <- sample(2, nrow(Data), replace = TRUE, prob = c(0.7, 0.3))
traindata <- Data[ind == 1, ]
testdata <- Data[ind == 2, ]

# 建立bagging分类模型
library(adabag)
bagging.model <- bagging(流失 ~ ., data = traindata)

# 预测结果
train_predict <- predict(bagging.model, newdata = traindata)  # 训练数据集
test_predict <- predict(bagging.model, newdata = testdata)  # 测试数据集

# 输出训练数据的分类结果
train_predictdata <- cbind(traindata, predictedclass = train_predict$class) 
# 输出训练数据的混淆矩阵
(train_confusion <- table(actual = traindata$流失, predictedclass = train_predict$class)) 
# 输出测试数据的分类结果
test_predictdata <- cbind(testdata, predictedclass = test_predict$class)
# 输出测试数据的混淆矩阵
(test_confusion <- table(actual = testdata$流失, predictedclass = test_predict$class))



# 6.6    构建randomForest模型并进行分类预测
# randomForest模型
setwd("F:/数据及程序/第6章/示例程序")  # 设置工作空间
Data <- read.csv("./data/telephone.csv")  # 读入数据
Data[, "流失"] <- as.factor(Data[, "流失"])  # 将目标变量转换成因子型
set.seed(1234)  # 设置随机种子
# 数据集随机抽70%定义为训练数据集，30%为测试数据集
ind <- sample(2, nrow(Data), replace = TRUE, prob = c(0.7, 0.3))
traindata <- Data[ind == 1, ]
testdata <- Data[ind == 2, ]

# 建立randomForest模型
library(randomForest)
randomForest.model <- randomForest(流失 ~ ., data = traindata)

# 预测结果
test_predict <- predict(randomForest.model, newdata = testdata)  # 测试数据集

# 输出训练数据的混淆矩阵
(train_confusion <- randomForest.model$confusion)
# 输出测试数据的混淆矩阵
(test_confusion <- table(actual = testdata$流失, predictedclass = test_predict))



# 6.6   构建svm模型并进行分类预测
# svm模型
setwd("F:/数据及程序/第6章/示例程序")  # 设置工作空间
Data <- read.csv("./data/telephone.csv")  # 读入数据
Data[, "流失"] = as.factor(Data[, "流失"])  # 将目标变量转换成因子型
set.seed(1234)  # 设置随机种子
# 数据集随机抽70%定义为训练数据集，30%为测试数据集
ind <- sample(2, nrow(Data), replace = TRUE, prob = c(0.7, 0.3))
traindata <- Data[ind == 1, ]
testdata <- Data[ind == 2, ]

# 建立svm模型
library(e1071)
svm.model <- svm(流失 ~ ., data = traindata)

# 预测结果
train_predict <- predict(svm.model, newdata = traindata)  # 训练数据集
test_predict <- predict(svm.model, newdata = testdata)  # 测试数据集

# 输出训练数据的分类结果
train_predictdata <- cbind(traindata, predictedclass = train_predict) 
# 输出训练数据的混淆矩阵
(train_confusion <- table(actual = traindata$流失, predictedclass = train_predict)) 
# 输出测试数据的分类结果
test_predictdata <- cbind(testdata, predictedclass = test_predict)
# 输出测试数据的混淆矩阵
(test_confusion <- table(actual = testdata$流失, predictedclass = test_predict))



# 6.7     ROC曲线和PR曲线图代码
# ROC曲线和PR曲线
library(ROCR)
library(gplots)

# 预测结果
train_predict <- predict(lda.model, newdata = traindata)  # 训练数据集
test_predict <- predict(lda.model, newdata = testdata)  # 测试数据集

par(mfrow = c(1, 2))
# ROC曲线
# 训练集
predi <- prediction(train_predict$posterior[, 2], traindata$流失)
perfor <- performance(predi, "tpr", "fpr")
plot(perfor, col = "red", type = "l", main = "ROC曲线", lty = 1)  # 训练集的ROC曲线
# 测试集
predi2 <- prediction(test_predict$posterior[, 2], testdata$流失)
perfor2 <- performance(predi2, "tpr", "fpr")
par(new = T)
plot(perfor2, col = "blue", type = "l", pch = 2, lty = 2)  # 测试集的ROC曲线
abline(0, 1)
legend("bottomright", legend = c("训练集", "测试集"), bty = "n", 
       lty = c(1, 2), col = c("red", "blue"))  # 图例

# PR曲线
# 训练集
perfor <- performance(predi, "prec", "rec")
plot(perfor, col = "red", type = "l", main = "PR曲线", xlim = c(0, 1), 
     ylim = c(0, 1), lty = 1)  # 训练集的PR曲线
# 测试集
perfor2 <- performance(predi2, "prec", "rec")
par(new = T)
plot(perfor2, col = "blue", type = "l", pch = 2, xlim = c(0, 1), 
     ylim = c(0, 1), lty = 2)  # 测试集的PR曲线
abline(1, -1)
legend("bottomleft", legend = c("训练集", "测试集"), bty = "n", 
       lty = c(1, 2), col = c("red", "blue"))  # 图例
