# 6.2.1   C4.5决策树预测客户是否流失
# C4.5决策树
# 设置工作空间
setwd("F:/数据及程序/第6章/示例程序")  # 设置工作空间
Data <- read.csv("./data/Telephone.csv")  # 读入数据
Data[, "流失"] <- as.factor(Data[, "流失"])  # 将目标变量转换成因子型
set.seed(1234)  # 设置随机种子

# 数据集随机抽70%定义为训练数据集，30%为测试数据集
ind <- sample(2, nrow(Data), replace = TRUE, prob = c(0.7, 0.3))
traindata <- Data[ind == 1, ]
testdata <- Data[ind == 2, ]

# 建立决策树模型预测客户是否流失
library(party)  # 加载决策树的包
ctree.model <- ctree(流失 ~ ., data = traindata)  # 建立C4.5决策树模型
plot(ctree.model, type = "simple")  # 输出决策树图

# 预测结果
train_predict <- predict(ctree.model)  # 训练数据集
test_predict <- predict(ctree.model, newdata = testdata)  # 测试数据集

# 输出训练数据的分类结果
# 输出训练数据的分类结果
train_predictdata <- cbind(traindata, predictedclass = train_predict) 
#输出训练数据的混淆矩阵
(train_confusion <- table(actual = traindata$流失, predictedclass = train_predict) )
# 输出测试数据的分类结果
test_predictdata <- cbind(testdata, predictedclass = test_predict)
# 输出测试数据的混淆矩阵
(test_confusion <- table(actual = testdata$流失, predictedclass = test_predict))



# 6.2.2     CART决策树预测客户是否流失
# CART决策树
setwd("F:/数据及程序/第6章/示例程序")  # 设置工作空间
Data <- read.csv("./data/telephone.csv")  # 读入数据
Data[, "流失"] <- as.factor(Data[, "流失"])  # 将目标变量转换成因子型
set.seed(1234)  # 设置随机种子

# 数据集随机抽70%定义为训练数据集，30%为测试数据集
ind <- sample(2, nrow(Data), replace = TRUE, prob = c(0.7, 0.3))
traindata <- Data[ind == 1, ]
testdata <- Data[ind == 2, ]

# 建立决策树模型预测客户是否流失
library(tree)  # 加载决策树的包
tree.model <- tree(流失 ~ ., data = traindata)  # 建立CART决策树模型
plot(tree.model, type = "uniform")  # 输出决策树图
text(tree.model)

# 预测结果
train_predict <- predict(tree.model, type = "class")  # 训练数据集
test_predict <- predict(tree.model, newdata = testdata, type = "class")  # 测试数据集

# 输出训练数据的分类结果
train_predictdata <- cbind(traindata, predictedclass = train_predict) 
# 输出训练数据的混淆矩阵
(train_confusion <- table(actual = traindata$流失, predictedclass = train_predict)) 
# 输出测试数据的分类结果
test_predictdata <- cbind(testdata, predictedclass = test_predict)
# 输出测试数据的混淆矩阵
(test_confusion <- table(actual = testdata$流失, predictedclass = test_predict))




# 6.2.3       C5.0决策树预测客户是否流失
# C5.0决策树
setwd("F:/数据及程序/第6章/示例程序")  # 设置工作空间
Data <- read.csv("./data/telephone.csv")  # 读入数据
Data[, "流失"] <- as.factor(Data[, "流失"])  # 将目标变量转换成因子型
set.seed(1234)  # 设置随机种子

# 数据集随机抽70%定义为训练数据集，30%为测试数据集
ind <- sample(2, nrow(Data), replace = TRUE, prob = c(0.7, 0.3))
traindata <- Data[ind == 1, ]
testdata <- Data[ind == 2, ]

# 建立决策树模型预测客户是否流失
library(C50)  # 加载决策树的包
c50.model <- C5.0(流失 ~ ., data = traindata)  # 建立C5.0决策树模型
plot(c50.model)  # 输出决策树图

# 预测结果
train_predict <- predict(c50.model, newdata = traindata, type = "class")  # 训练数据集
test_predict <- predict(c50.model, newdata = testdata, type = "class")  # 测试数据集

# 输出训练数据的分类结果
train_predictdata <- cbind(traindata, predictedclass = train_predict) 
# 输出训练数据的混淆矩阵
(train_confusion <- table(actual = traindata$流失, predictedclass = train_predict)) 
# 输出测试数据的分类结果
test_predictdata <- cbind(testdata, predictedclass = test_predict)
# 输出测试数据的混淆矩阵
(test_confusion <- table(actual = testdata$流失, predictedclass = test_predict))
