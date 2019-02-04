# 11.1.2  	Rattle安装
install.packages("RGtk2")
install.packages("rattle")

library(rattle)
rattle( )



# 11.3.3  # odbcConnect( )函数进行数据库连接
library(RODBC)
odbcConnect("ids_user_action", "Daniel.xie", "xie@iedlan")



# 11.3.4 # 将剪贴板的数据导入到R
actionuser <- read.table("clipboard", header = TRUE)
dim(actionuser)
head(actionuser)



# 11.3.4 # 将SPSS数据集读入R中
library(foreign)
mydataset <- read.spss("C:\\Users\\Think\\Desktop\\居民储蓄调查数据.sav")
mydataset <- as.data.frame(mydataset)




# 11.4.5 # 对mtcars数据集进行交互图操作，执行如下代码：
library(latticist)
mtcars$cyl <- factor(mtcars$cyl)
mtcars$gear <- factor(mtcars$gear)
latticist(mtcars)

