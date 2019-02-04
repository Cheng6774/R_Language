#install.packages("arules")    #Apriori算法程序包
library(arules)
data(Groceries)               #调用R自带关联规则数据集Groceries（transaction类型的格式）
read.transactions("total_data.csv", format =c("basket"), sep =",",cols = 1, rm.duplicates =FALSE, encoding = "unknown")

#-----------------------查看数据的详细信息
# Groceries数据集为杂货店一个月的交易记录集，包括169中商品项目，9835个记录
head(Groceries)     #查看前6条记录
str(Groceries)      #查看数据的内部结构
summary(Groceries)  #查看数据的基本统计量
class(Groceries)    #查看数据类型，关联规则处理的数据类型为“transactions”
dim(Groceries)      #查看数据的维数  行数和列数
colnames(Groceries[,1:5])   #查看第1-5列的列名
#inspect(Groceries)   #查看transactions数据集中的全部记录

#--------------------- Apriori实现关联规则
# apriori的参数设置为支持度0.01，置信度0.1，关联前项和后项包含的最小项目数为2，最大项数为15
rules=apriori(Groceries, parameter=list(support=0.01,confidence=0.1,minlen=2,maxlen=15))  

# 如果需要了解某一种商品的关联情况，可以使用appearance参数，以下为探究与whole milk关联的商品，设置关联前项为whole milk，后项不限
# rules=apriori(Groceries, parameter=list(support=0.01,confidence=0.1,minlen=2),appearance=list(lhs="whole milk",default="rhs"))  

rules           #查看生成的关联规则
rules<-sort(rules,by='support')               #对规则按照support从高到低排序
inspect(rules[1:10])            #查看前10条规则         

# 对规则进行格式转换并输出
R1<-as(rules,'data.frame')    #将关联规则设置成dataframe格式
#setwd("D:\\R files\\Data")
write.csv(R1,"Groceries_apriori.csv") 

#-------------------- 关联规则可视化
#install.packages("arulesViz")   #关联规则可视化程序包
library ( arulesViz )

plot(rules, measure = c("support", "lift"), shading = "confidence")   #画出关联结果的散点图
plot(rules,method="grouped")    #作出rules的分组图

# 绘制Two‐key图，其中关联规则点的颜色深浅表示其所代表的关联规则中所含商品的多少，商品种类越多，点的颜色越深
plot(rules,shading="order", control=list(main="Two‐key plot"))　

#========================== MODEL2. 输入数据集为稀疏矩阵 ===========================
#setwd("D:\\R files\\Data")
#  若输入矩阵为其他形式，可转换，将其变成稀疏矩阵
#  数据集testA为简单的输入稀疏矩阵，7个项目和9条记录

testA=read.csv(file="testA.csv",as.is = T,sep=",")      #读入稀疏矩阵
set<-testA
factorK<-function(X){factor(X,levels=0:1)}        #建立factorK函数
T1<-as(data.frame(apply(set,2,factorK)),"transactions")    #根据列对应的值是否为1建立transaction格式的数据集
T2<-apriori(T1,parameter=list(minlen=2,supp=0.3,conf=0.5))      #得到支持度0.1，置信度0.5的关联规则
T2<-sort(T2,by='support')      #将关联规则按支持度从高到低排序
inspect(T2[1:10])

# 对规则进行格式转换
T3<-as(T2,'data.frame')    #将关联规则设置成dataframe格式

# 画图
library ( arulesViz )
plot(T2, measure = c("support", "lift"), shading = "confidence")   #画出关联结果的散点图
plot(T2,method="grouped")    #作出分组图

# 绘制Two‐key图，其中关联规则点的颜色深浅表示其所代表的关联规则中所含商品的多少，商品种类越多，点的颜色越深
plot(T2,shading="order", control=list(main="Two‐key plot"))　

#  将关联规则转换格式输出
#setwd("D:\\R files\\Data")
#write.csv(T3,"testA_apriori.csv") 