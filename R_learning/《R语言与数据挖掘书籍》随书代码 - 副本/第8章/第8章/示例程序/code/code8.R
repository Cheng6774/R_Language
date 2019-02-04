# 8.1  	示例：列表和数据框转换为transactions格式。
# transactions格式的转换
# 列表转换transactions
a_list <- list(c("a", "b", "c"), c("a", "b"), c("a", "b", "d"), c("c", "e"), 
               c("a", "b", "d", "e"))
names(a_list) <- paste("Tr", c(1:5), sep = "")  # 列表重命名
library(arules)
trans <- as(a_list, "transactions")  # 将列表转换为transactions
inspect(trans)  # 检查是否转换成功
# 数据框转换transactions
a_df <- data.frame(age = as.factor(c(6, 8, 7, 6, 9, 5)), 
                   grade = as.factor(c(1, 3, 1, 1, 4, 1)))
trans2 <- as(a_df, "transactions")  # 将数据框转换为transactions
inspect(trans2)  # 检查是否转换成功



# 8.1   	实例：对Groceries进行关联规则分析。
# 关联规则分析
library(arules)  # 加载程序包arules
data("Groceries")  # 提取数据集Groceries
# 数据集相关的统计汇总信息，包括事务和项集的汇总情况
summary(Groceries)
# 建立关联规则rules，设定支持度最小值为0.001，置信度最小值为0.5
rules <- apriori(Groceries, parameter = list(support = 0.001, confidence = 0.5))




# 8.1  	示例：使用summary函数查看规则的汇总信息。
# 查看规则的汇总信息
summary(rules)




# 8.1	示例：查看Groceries中商品的支持度（销售占比）。
# 查看Groceries中商品的支持度
# Groceries数据中前3件商品的支持度
itemFrequency(Groceries[, 1:3])
# Groceries数据中商品whole milk、other vegetables的支持度
itemFrequency(Groceries[, c("whole milk", "other vegetables")])




# 8.1  	示例：对数据集Groceries中的项集作支持度频率图
# 输出支持度频率图
# 输出支持度support大于0.1的项集的支持度频率图
itemFrequencyPlot(Groceries, support = 0.1)
#输出支持度support最大的前20个项集的支持度频率图
itemFrequencyPlot(Groceries , topN = 20)




# 8.1    示例：查看关联规则rules中的前五项。
# 查看数据和规则
# 查看关联数据Groceries的前五项
inspect(Groceries[1:5])
# 查看前五项关联规则
inspect(rules[1:5])



# 8.1   示例：计算"coverage", "fishersExactTest", "conviction", "chiSquared"的值。
# 计算规则的各项附加信息
# 计算"coverage", "fishersExactTest", "conviction", "chiSquared" 
qualityMeasures <- interestMeasure(rules, measure = c("coverage", "fishersExactTest", 
                                                      "conviction", "chiSquared"), 
                                   transactions = Groceries) 
summary(qualityMeasures)                        
quality(rules) <- cbind(quality(rules), qualityMeasures)  # 合并quality measures
quality(rules) <- round(quality(rules), digits = 3)  # 保留小数点后3位
inspect(head(rules))  # 查看合并后的关联规则




# 8.1	示例：按提升度对rules排序。
# 规则排序
# 按支持度递减的顺序对rules排序
sort(rules, by = "support")
# 按支持度递减的顺序，输出支持度最大的前五项规则
inspect(sort(rules, by = "support")[1:5])




# 8.1   	示例：提取符合一定条件的关联规则。
# 提取规则
# 提取后项为"whole milk"并且提升度大于1.2的关联规则
subset(rules, subset = rhs %in% "whole milk" & lift >= 1.2)
# 查看满足后项为"whole milk"并且提升度大于1.2的关联规则的前五项
inspect(subset(rules, subset = rhs %in% "whole milk" & lift >= 1.2)[1:5])



# 8.1   对Groceries进行关联分析
# 关联规则分析
library(arules)  # 加载程序包arules
library(arulesViz)  # 加载程序包arulesViz

data("Groceries")  # 提取数据集Groceries
summary(Groceries)  # 数据集相关的统计汇总信息，包括事务和项集的汇总情况
inspect(Groceries[1:10])  # 查看数据集的前10个事务
Size <- size(Groceries)  # 查看每个交易记录包含的商品数目

# 查看Groceries中商品的支持度
ItemFrequency <- itemFrequency(Groceries) 
# 查看Groceries数据中商品whole milk、other vegetables的支持度
itemFrequency(Groceries[, c("whole milk", "other vegetables")])

# 作出支持度support最大的前20个项集的稀疏矩阵图
itemFrequencyPlot(Groceries, topN = 20)

# 建立关联规则rules，条件是支持度大于0.001且置信度大于0.5
rules <- apriori(Groceries, parameter = list(support = 0.001, confidence = 0.5))
inspect(rules[1:10])  # 查看rules前十则关联规则

# 查看其它的quality measures
# 计算"coverage", "fishersExactTest", "conviction", "chiSquared" summary(qualityMeasures)
qualityMeasures <- interestMeasure(rules, measure = c("coverage", "fishersExactTest", 
                                                      "conviction", "chiSquared"), 
                                   transactions = Groceries)    
quality(rules) <- cbind(quality(rules), qualityMeasures)  # 合并quality measures
quality(rules) <- round(quality(rules), digits = 3)  # 保留小数点后3位
inspect(head(rules))  # 查看合并后的关联规则

# 规则排序
# 按提升度排序
rules.sorted <- sort(rules, by = "lift")
# 查看排序后的前五则关联规则
inspect(rules.sorted[1:5])
# 提取后项为"whole milk"并且提升度大于1.2的关联规则
rules.subset <- subset(rules, subset = rhs%in%"whole milk" & lift >= 1.2)
# 查看满足后项为"whole milk"并且提升度大于1.2的关联规则的前五项
inspect(rules.subset[1:5])

# 对关联规则做散点图
plot(rules, method = "scatter", interactive = T)
