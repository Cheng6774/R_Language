# 6.5     朴素贝叶斯算法预测客户是否流失
# 朴素贝叶斯分类算法
setwd("F:/数据及程序/第6章/示例程序")  # 设置工作空间
Data <- read.csv("./data/telephone.csv")  # 读入数据
Data[, "流失"] <- as.factor(Data[, "流失"])  # 将目标变量转换成因子型
set.seed(1234)  # 设置随机种子
# 数据集随机抽70%定义为训练数据集，30%为测试数据集
ind <- sample(2, nrow(Data), replace = TRUE, prob = c(0.7, 0.3))
traindata <- Data[ind == 1, ]
testdata <- Data[ind == 2, ]

# 使用naiveBayes函数建立朴素贝叶斯分类模型
library(e1071)  # 加载e1071包
naiveBayes.model <- naiveBayes(流失 ~ ., data = traindata)  # 建立朴素贝叶斯分类模型
# 预测结果
train_predict <- predict(naiveBayes.model, newdata = traindata)  # 训练数据集
test_predict <- predict(naiveBayes.model, newdata = testdata)  # 测试数据集
# 输出训练数据的分类结果
train_predictdata <- cbind(traindata, predictedclass = train_predict) 
# 输出训练数据的混淆矩阵
(train_confusion <- table(actual = traindata$流失, predictedclass = train_predict)) 
# 输出测试数据的分类结果
test_predictdata <- cbind(testdata, predictedclass = test_predict)
# 输出测试数据的混淆矩阵
(test_confusion <- table(actual = testdata$流失, predictedclass = test_predict))

# 使用NaiveBayes函数建立朴素贝叶斯分类模型
library(klaR)  # 加载klaR包
NaiveBayes.model <- NaiveBayes(流失 ~ ., data = traindata)  # 建立朴素贝叶斯分类模型
# 预测结果
train_predict <- predict(NaiveBayes.model)  # 训练数据集
test_predict <- predict(NaiveBayes.model, newdata = testdata)  # 测试数据集
# 输出训练数据的分类结果
train_predictdata <- cbind(traindata, predictedclass = train_predict$class) 
# 输出训练数据的混淆矩阵
(train_confusion <- table(actual = traindata$流失, predictedclass = train_predict$class)) 
# 输出测试数据的分类结果
test_predictdata <- cbind(testdata, predictedclass = test_predict$class)
# 输出测试数据的混淆矩阵
(test_confusion <- table(actual = testdata$流失, predictedclass = test_predict$class))
