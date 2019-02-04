library(psych)
library(GPArotation)
correlations <- cor(total_data) # 计算变量相关系数矩阵并赋值给correlations
fa.parallel(correlations, n.obs = 979, fa = "both", n.iter = 100, main = "平行分析碎石图")
#Parallel analysis suggests that the number of factors =  3  and the number of components =  2
fa <- fa(correlations, nfactors = 3, rotate = "none", fm = "pa")
# 提取3个因子，不旋转，使用主轴迭代法
fa
fa.varimax <- fa(correlations, nfactors = 3, rotate = "varimax", fm = "pa")
fa.promax <- fa(correlations, nfactors = 3, rotate = "promax", fm = "pa")
factor.plot(fa.promax, labels = rownames(fa.promax$loadings))
fa.diagram(fa.promax, digits = 3)# digits = 3表示保留3为小数

