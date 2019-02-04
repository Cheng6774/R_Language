# 6.1   	实例：利用数据集women建立简单线性回归模型
# 线性回归模型
data(women)
lm.model <- lm( weight ~ height - 1, data = women)  # 建立线性回归模型
summary(lm.model)  # 输出模型的统计信息
coefficients(lm.model)  # 输出参数估计值
confint(lm.model, parm = "speed", level = 0.95)  # parm缺省则计算所有参数的置信区间
fitted(lm.model)  # 列出拟合模型的预测值
anova(lm.model)  # 生成一个拟合模型的方差分析表
vcov(lm.model)  # 列出模型参数的协方差矩阵
residuals(lm.model)  # 列出模型的残差
AIC(lm.model)  # 输出AIC值
par(mfrow = c(2, 2)) 
plot(lm.model)  # 生成评价拟合模型的诊断图



# 6.1   	实例：结婚时间、教育、宗教等其它变量对出轨次数的影响
# 逻辑回归模型
data(Affairs, package = "AER")
# 由于变量affairs为正整数，为了进行Logistic回归先要将其转化为二元变量。
Affairs$ynaffair[Affairs$affairs > 0] <- 1
Affairs$ynaffair[Affairs$affairs == 0] <- 0
Affairs$ynaffair <- factor(Affairs$ynaffair, levels = c(0, 1), 
                           labels = c("No", "Yes"))
# 建立Logistic回归模型
model.L <- glm(ynaffair ~ age + yearsmarried + religiousness + rating, 
               data = Affairs, family = binomial (link = logit))
summary(model.L)  # 展示拟合模型的详细结果
predictdata <- data.frame(Affairs[, c("age", "yearsmarried", "religiousness", "rating")])
# 由于拟合结果是给每个观测值一个概率值，下面以0.4作为分类界限
predictdata$y <- (predict(model.L, predictdata, type = "response") > 0.4)
predictdata$y[which(predictdata$y == FALSE)] = "No"  # 把预测结果转换成原先的值(Yes或No)
predictdata$y[which(predictdata$y == TRUE)] = "Yes" 
confusion <- table(actual = Affairs$ynaffair, predictedclass = predictdata$y)  # 混淆矩阵
confusion 
(sum(confusion) - sum(diag(confusion))) / sum(confusion)  # 计算错判率



# 6.1  	实例：对美国妇女的平均身高和体重数据进行Bonferroni离群点检验
#  Bonferroni离群点检验
library(car)
fit <- lm(weight ~ height, data = women)  # 建立线性模型
outlierTest(fit)   # Bonferroni离群点检验
women[10, ] <- c(70, 200)  # 将第10个观测的数据该成height = 70，weight = 200
fit <- lm(weight ~ height, data = women)
outlierTest(fit)  # Bonferroni离群点检验



# 6.1 	实例：对代码清单 6 1中的模型lm.model的误差做自相关性检验
# 检验误差项的自相关性
durbinWatsonTest(lm.model)



# 6.1 	实例：使用数据集freeny建立逻辑回归模型，并进行自变量选择
# 自变量选择
Data <-  freeny
lm <- lm(y ~ ., data = Data)  # logistic回归模型
summary(lm)
lm.step <- step(lm, direction = "both")  # 一切子集回归
summary(lm.step)
lm.step <- step(lm, direction = "forward")  # 前进法
summary(lm.step)
lm.step <- step(lm, direction = "backward")  # 后退法
summary(lm.step)

