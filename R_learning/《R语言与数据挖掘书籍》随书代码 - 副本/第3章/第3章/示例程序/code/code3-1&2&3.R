# 3.1	示例：利用交互式编辑器修改score数据集中变量p1的名称为student
# 交互式编辑器修改变量名
score <- data.frame(student = c("A", "B", "C", "D"), 
                    gender = c("M", "M",  "F", "F"), 
                    math = c(90, 70, 80, 60), 
                    Eng = c(88, 78, 69, 98), 
                    p1 = c(66, 59, NA, 88))
fix(score)  # 打开交互式编辑器，数据框的交互式编辑器为一个Data Editor
score.list <- as.list(score)  # 将score转化为列表
fix(score.list)  # 打开交互式编辑器，列表的交互式编辑器为一个记事本



# 3.1	示例：使用rename()函数修改变量名
# rename()函数修改变量名
library(reshape)  # 加载reshape包
rename(score, c(p1 = "Chinese"))  # 对score中的p1重命名为Chinese
rename(score.list, c(p1 = "Chinese"))  # 对score.list中的p1重命名为Chinese



# 3.1	示例：使用name()函数修改变量名
# names()函数修改变量名
names(score)[5] <- "Chinese"  # 将score的第5列列名改为Chinese
score



# 3.1	示例：使用colnames()函数修改变量名
# colnames函数和rownames函数修改变量名
colnames(score)[5] <- "Chinese"  # 将score的第5列列名改为Chinese
rownames(score) <- letters[1:4]  # 将score的行名改为a, b, c, d
score



# 3.2 	示例：检验数据集score中的缺失值，并删除score中含有缺失值的行
# 缺失值分析
is.na(score)  # 缺失值检测，TURE表明该位置的值为缺失值
anyNA(score)  # 检测score是否存在缺失值
na.omit(score)  # 删除score中存在缺失值的行
complete.cases(score)  # 检测哪一行存在缺失值，FALSE表明该值所对应的行存在缺失值
score[complete.cases(score), ]  # 删除score中存在缺失值的行



# 3.3	示例：对数据集score中的变量math和Chinese进行排序
# 使用sort函数排序
sort(score$math)  # 对score的math列按照从小到大排列
sort(score$math, decreasing = TRUE)  # 对score的math列按照从大到小排列
sort(score$Chinese, na.last = TRUE)  # 对score的Chinese列按照从小到大排列，并且把缺失值放在最后



# 3.3	示例：对向量x进行排序
# 使用rank函数排序
x <- c(3, 4, 2, 5, 5, 3, 8, 9)
rank(x)  # 求出x的秩
rank(x, ties.method = "first")  # 求x的秩，ties.method = "first"
rank(x, ties.method = "random")  # 求x的秩，ties.method = " random " 
rank(x, ties.method = "max")  # 求x的秩，ties.method = " max "



# 3.3	示例：将数据集score按照变量math进行排
# 使用order函数排序
order(score$math)  # 对score$math升序排列，返回的值表示对应值在原向量中的位置。
score[order(score$math), ]
score[order(-score$math), ]  # 输出排序结果


