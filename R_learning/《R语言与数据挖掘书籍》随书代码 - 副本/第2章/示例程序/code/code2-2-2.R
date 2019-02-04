# 2.2.2	示例：创建按照不同方式读取数据的矩阵及定义矩阵的行列名
# 创建矩阵
# 创建向量作为矩阵的数据
x <- c(1:10)
# 创建一个矩阵，定义矩阵的列数为2，行数为5，按行读取数据
(a <- matrix(x, ncol = 2, nrow = 5, byrow = T))       
# 创建一个矩阵，定义矩阵的列数为2，行数为5，按列读取数据
b <- matrix(x)
dim(b) <- c(5, 2)   
b
# 创建一个5行2列，按列读取数据的矩阵，dimnames定义矩阵行列的名称
(c <- matrix(x, ncol = 2, nrow = 5, byrow = F, 
             dimnames = list(c("r1", "r2", "r3", "r4", "r5"), c("c1", "c2"))))


# 2.2.2	示例：不同数据排列方式的矩阵转化为向量
# 矩阵转化为向量
x <- c(1:10)
# 创建一个5行2列的矩阵，元素按列填充
(a <- matrix(x, ncol = 2, nrow = 5, byrow = F))
# 将矩阵转化为向量
(b <- as.vector(a))      
# 创建一个5行2列的矩阵，元素按行填充
(c <- matrix(x, ncol = 2, nrow = 5, byrow = T)) 
# 将矩阵转化为向量
(d <- as.vector(c))



# 2.2.2	示例：多种不同的矩阵索引方式
# 矩阵索引
# 示例矩阵
x <- c(1:10)
a <- matrix(x, ncol = 2, nrow = 5, byrow = F, 
            dimnames = list(c("r1", "r2", "r3", "r4", "r5"), c("c1", "c2")))
a
# 根据位置索引
a[2, 1]
# 根据行和列的名称索引
a["r2", "c1"]
# 使用一维下标索引
a[1, ]  # 检索第一行
a[, 1]  # 检索第一列
# 使用数值型向量索引
a[c(3:5), ]  # 检索第三至第五行



# 2.2.2	示例：矩阵的合并与删除
# 矩阵的编辑
# 示例矩阵
x <- c(1:10)
(a <- matrix(x, ncol = 2, nrow = 5, byrow = F))
# 矩阵合并
(a1 <- rbind(a, c(11,12)))  # 按行的形式合并
(a2 <- cbind(a, c(11:15)))  # 按列的形式合并
(a3 <- rbind(a, 1))  # 按行的形式合并时，循环不足后合并
(a4 <- cbind(a, 1))  # 按列的形式合并时，循环不足后合并
# 删除矩阵中的元素
(a5 <- a[-1, ])  # 删除矩阵的第一行
(a6 <- a[, -1])  # 删除矩阵的第一列



# 2.2.2            矩阵的运算
# 矩阵的运算
A <- matrix(c(1:9), ncol = 3, nrow = 3)
B <- matrix(c(9:1), ncol = 3, nrow = 3)
# 四则运算：加减乘除，要求两个矩阵的维数相同，对应各位置的元素做运算
C <- 2 * A + B - B / A
# 对矩阵的各列求和
colsums_A <- colSums(A)
# 对矩阵的各列求均值
colmeans_A <- colMeans(A)
# 对矩阵的各行求和
rowsums_A <- rowSums(A)
# 对矩阵的各行求均值
rowmeans_A <- rowMeans(A)
# 转置运算
trans_A <- t(A)  # 行列转置
# 方阵求解行列式
det_A <- det(A)
# 矩阵的内积 
crossprod(A, B)
inner_product <- t(A) %*% B  # 等价于crossprod(A,B)
# 矩阵的外积（叉积）
outer(A,B)
cross_product <- A %o% B  # 等价于outer(A,B)
# 矩阵的乘法,要求矩阵A的列数和矩阵B的行数相等
(D <- A %*% B)
# 矩阵取对角运算及生成对角阵
diag_A <- diag(A)  # 矩阵取对角
diag(diag_A)  # 生成对角阵
# 求解逆矩阵，要求矩阵可逆（行列式不为0）
M <- matrix(c(1:8, 10), ncol = 3, nrow = 3)   
inverse_M <- solve(M)
# 求解矩阵的特征值和特征向量
ev_M <- eigen(M)
