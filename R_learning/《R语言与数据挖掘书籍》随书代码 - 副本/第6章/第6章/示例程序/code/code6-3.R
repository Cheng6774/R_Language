# 6.3     BP神经网络算法预测客户是否流失
# BP神经网络
setwd("F:/数据及程序/第6章/示例程序")  # 设置工作空间
Data <- read.csv("./data/telephone.csv")  # 读入数据
Data[, "流失"] <- as.factor(Data[, "流失"])  # 将目标变量转换成因子型
set.seed(1234)  # 设置随机种子
# 数据集随机抽70%定义为训练数据集，30%为测试数据集
ind <- sample(2, nrow(Data), replace = TRUE, prob = c(0.7, 0.3))
traindata <- Data[ind == 1, ]
testdata <- Data[ind == 2, ]

# BP神经网络建模
library(nnet) #加载nnet包
# 设置参数
size <- 10  # 隐层节点数为10
decay <- 0.05  # 权值的衰减参数为0.05
nnet.model <- nnet(流失 ~ ., traindata, size = size, decay = decay)  # 建立BP神经网络模型
summary(nnet.model)  # 输出模型概要

# 预测结果
train_predict <- predict(nnet.model, newdata = traindata, type = "class")  # 训练数据集
test_predict <- predict(nnet.model, newdata = testdata, type = "class")  # 测试数据集

# 输出训练数据的分类结果
train_predictdata <- cbind(traindata, predictedclass = train_predict) 
# 输出训练数据的混淆矩阵
(train_confusion <- table(actual = traindata$流失, predictedclass = train_predict)) 
# 输出测试数据的分类结果
test_predictdata <- cbind(testdata, predictedclass = test_predict)
# 输出测试数据的混淆矩阵
(test_confusion <- table(actual = testdata$流失, predictedclass = test_predict))
