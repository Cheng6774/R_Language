# 安装
# install.packages("randomForest")
# 加载
library(randomForest)

# 使用R内置鸢尾花数据
data(iris)
head(iris)

# 设置随机数种子保证结果可重复
set.seed(315)

# 随机森林分类
iris.rf = randomForest(Species ~ ., data=iris, importance=TRUE, proximity=TRUE)

# 结果如下：包括分析的命令，优化选择的分类变量个数2，和数据再分类和错误率统计结果。此例 中使用2个变量分类，三种花的分类错误率为4%，每组中分类结果和错误率详见表格。
print(iris.rf)

# 查看每个变量的分类贡献度，显示仅保留两位小数可读性更好
round(importance(iris.rf), 2)

