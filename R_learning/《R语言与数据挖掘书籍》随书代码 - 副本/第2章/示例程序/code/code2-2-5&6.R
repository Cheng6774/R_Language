# 2.2.5	示例：因子型向量的转换及创建
# 创建因子
# 将statistics分解为因子型向量，水平为26个小写字母
(ff <- factor(substring("statistics", 1:10, 1:10), levels = letters))  
# 去除没有包含在向量中的水平
(f. <- factor(ff))           
ff[, drop = TRUE]  # 等价于f. <- factor(ff)
# 创建因子型向量，水平名称为letter
factor(letters[1:20], labels = "letter")
# 创建有序的因子型向量
z <- factor(LETTERS[3:1], ordered = TRUE)  
z




# 2.2.5 	示例：创建不同水平的因子序列
# 创建因子序列
# 生成水平数为3，每个水平重复3次的因子序列
gl(3, 3)                
# 生成水平为“TRUE”和“FALSE”，每个水平重复3次的序列
gl(2, 3, labels = c("TRUE","FALSE"))  
# 生成水平数为2，序列长度为10的序列
gl(2, 1, 10)            
# 生成水平数为2，每个水平重复2次，序列长度为10的序列
gl(2, 2, 10)            
# 生成水平数为3，每个水平重复3次的有序因子序列
gl(3, 3, ordered = TRUE)  



# 2.2.5	示例：展示因子在R中的存储方式
# 因子存储方式
# 创建字符型向量
status <- c("Poor", "Improved", "Excellent", "Poor")  
class(status)  # 查看向量的类型
# 创建有序因子序列
status.factor <- factor(status, ordered = TRUE)     
class(status.factor)  # 查看数据的类型
storage.mode(status.factor)   
as.numeric(status.factor)  # 转化为数值型向量
levels(status.factor)  # 查看因子的水平



# 2.2.6  	示例：创建包含多种类型的向量的列表及内含多种结构的列表
# 创建列表
# 创建一个包含不同数据类型的向量的列表
data <- list(a = c(1, 2, 3, 4), b = c("one", "two", "three"), c = c(TRUE, FALSE),
             d = (1 + 2i))
data
summary(data)  # 查看列表的数据结构
# 创建一个内含多种结构的列表
g <- "My List"
h <- c(25, 26, 18, 39)
j <- matrix(1:10, nrow = 5)
# 创建一个包含字符串、向量、矩阵的列表
mylist <- list(title = g, ages = h, j)  
mylist  # 输出列表
summary(mylist)  # 查看列表的数据结构



# 2.2.6	示例：使用多种方式进行列表索引
# 列表索引
# 示例列表
data <- list(a = c(1, 2, 3, 4), b = c("one", "two", "three"), 
             c = c(TRUE, FALSE), d = (1 + 2i))
data
# 列索引
data[[1]]  # 索引第一列
data$a  # 索引列名称为a的列
data[["a"]]  # 索引列名称为a的列
# 元素索引
data[[1]][1]  # 索引第一列的第一个元素



# 2.2.6	示例：对列表进行合并及将列表转化为向量
# 列表编辑
# 示例列表
data <- list(a = c(1, 2,3 , 4), b = c("one", "two", "three"), 
             c = c(TRUE, FALSE), d = (1 + 2i))
data
# 增加名称为e的一列
(data1 <- c(data, list(e = c(5, 6, 7))))        
# 另外一种形式，与上面等价
(data2 <- c(data, e = list(c(5, 6, 7))))        
# 列表转化为向量
unlist(data1)
