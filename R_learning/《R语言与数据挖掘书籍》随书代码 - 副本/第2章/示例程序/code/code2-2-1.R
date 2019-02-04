# 2.2.1	示例：创建不同类型的向量
# 向量创建
x1 <- c(1,2,3,4)  # 创建数值型向量,可写成x1=c(1:4)
x2 <- c("a", "b", "c", "d")  # 创建字符型变量
x3 <- c(TRUE, FALSE, FALSE, TRUE)  # 创建逻辑型变量



# 2.2.1        向量索引
# 向量索引
# 下标方式索引（元素的值）
vector <- c(1, 2, 3, 4)  # 创建向量
vector[1]  # 查看第一个元素
vector[c(1:3)]  # 查看前三个元素
vector[-1]  # 查看除了第一个元素之外的所有元素
vector[-c(1:3)]  # 查看除了前三个元素之外的所有元素
vector[c(TRUE, TRUE, FALSE, FALSE)]  # 通过逻辑序列查看前两个元素
# 按名称索引	
names(vector) <- c("one", "two", "three", "four")  # 给向量中每个元素命名
vector[c("one", "two", "four")]  # 查看名称为“one”,“two”,“four”的元素
# which方式索引(元素的位置)
which(vector == 1)  # 向量中等于1的元素所在的位置
which(vector == c(1, 2))  # 向量中等于1和2的元素所在的位置
which(vector != 1)  # 向量中不等于1的元素所在的位置
which(vector > 2 & vector < 4)  # 满足多重条件的元素所在的位置
which.max(vector)  # 最大值所在的位置
which.min(vector)  # 最小值所在的位置
# subset方式索引
subset(vector, vector > 2 & vector < 4)  # 检索向量中满足条件的元素
# match方式索引
match(vector, c(1, 3))  # 判断向量中的元素是否等于1或3
# %in%方式索引
c(1, 5) %in% vector  # 判断向量中是否包含某项数据



# 2.2.1	示例：向量元素的扩展及删除
# 向量编辑
x <- c(1, 2, 3, 4)
# 向量扩展
(x <- c(x, c(5, 6, 7)))
# 单个元素的删除
(x <- x[-1])
# 多个元素的删除
(x <- x[c(3:5)])



# 2.2.1	示例：向量的排序及倒序
# 向量排序
# 创建3个无序的向量
x <- c(5, 6, 8, 7, 4, 1, 9)
x1 <- c("B", "A", "C")
x2 <- c(3, 2, NA, 1, 4, 5)
# 数值型数据排序（默认顺序为升序）
sort(x, decreasing = FALSE) 
sort(x, decreasing = TRUE)
# 字符型数据排序
sort(x1)
# 将缺失值（NA）放置到序列最末尾
sort(x2, na.last = TRUE)
# 倒序
rev(x)



# 2.2.1	实例：创建等差序列
# 等差序列
seq(1, -9)  # 只给出首项和尾项数据，by自动匹配为1或-1
seq(1, -9, length.out = 5)  # 给出首项和尾项数据以及长度，自动计算等差
seq(1, -9, by = -2)  # 给出首项和尾项数据以及等差，自动计算长度
seq(1, by = 2, length.out = 10) #给出首项和等差以及序列长度数据，自动计算尾项



# 2.2.1	示例：创建重复序列
# 重复序列
rep(1:3, 2)  # 重复序列两次
rep(1:3, each = 2)  # 序列中各个元素分别重复两次
rep(1:3, c(2, 1, 2))  # 按照规则重复序列中的各个元素
rep(1:3, each = 2, length.out = 4)  # 序列中各个元素分别重复两次，规定生成序列的长度为4
rep(1:3, each = 2, times = 3)  # 序列中各个元素分别重复两次，整个序列重复3次
rep(as.factor(c("因子1", "因子2", "因子3")), 3)  # 将因子型变量序列重复3次

