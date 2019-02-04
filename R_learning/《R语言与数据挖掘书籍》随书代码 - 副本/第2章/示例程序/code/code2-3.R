# 2.3  	示例：使用键盘输入数据
# 键盘输入
# 创建一个指定模式但不含数据的变量
mydata <- data.frame(age = numeric(0), gender = character(0), weight = numeric(0))
# 键盘输入变量
mydata <- edit(mydata)
# 另外一种键盘输入的方法
fix(mydata)



# 2.3.2	使用RODBC包来读入xls文件的示例代码
# 使用RODBC读取xls文件
# 安装RODBC包
install.packages("RODBC")
# 加载RODBC包
library(RODBC)
# 建立RODBC连接对象至Excel文件，并将连接赋予一个对象，myfile.xls为文件路径
channel <- odbcConnectExcel("myfile.xls")   
# 读取工作簿中的工作表至一个数据框，mysheet为要读取的工作表名
mydataframe <- sqlFetch(channel, "mysheet")  
odbcClose(channel)  # 关闭RODBC连接



# 2.3.3  安装并调用RODBC包的代码如下
# 安装RODBC包
install.packages("RODBC") 
library(RODBC)



# 2.3.4   R通过RODBC包访问数据库示例程序
# 访问SQL数据库示例程序
# 查看内存使用及清理R工作空间中的内存变量
gc()
rm(list = ls())
install.packages("RODBC")  # 安装RODBC包
library(RODBC)  # 载入RODBC包
# 通过一个数据源名称（mydsn）和用户名（user）以及密码（rply，如果没有设置，可以直接忽略）打开了一个ODBC数据库连接
mycon <- odbcConnect("mydsn", uid = "user", pwd = "rply")
# 将R自带的“USArrests”表写进数据库里
data(USArrests)
# 将数据流保存，这时打开SQL Server就可以看到新建的USArrests表
sqlSave(mycon, USArrests, rownames = "state", append = TRUE)
# 清除USArrests变量
rm(USArrests)
# 输出USArrests表中的内容
sqlFetch(mycon, "USArrests", rownames = "state")
# 对USArrests表执行了SQL语句select，并将结果输出
sqlQuery(mycon, "select * from USArrests")
# 删除USArrests表
sqlDrop(channel, "USArrests")
# 关闭连接
close(mycon)



# 2.3.5    示例：使用quantmod包抓取创梦天地每日的股票信息
# 利用quantmod包抓取股票数据
# 抓取创梦天地每日的股票信息
library(quantmod)
getSymbols("DSKY", scr = "yahoo")
# 查看最后六天的股票记录
tail(DSKY)
# 主绘图
chartSeries(DSKY, theme = "white")
# 三个基本图形
barChart(DSKY, theme = "white")  # 条形图
candleChart(DSKY, theme = "white")  # 蜡烛图
lineChart(DSKY, theme = "white")  # 线图
# 技术分析图
chartSeries(DSKY, theme = "white")
require(TTR)
addADX()  # 平均取向指标ADX
addATR()  # 平均真实波幅指标ART
addBBands()  # 布林线指标BBands
addCCI()  # 顺势指标CCI
addEMA()  # 指数平均指标EMA



# 2.3.5	示例：使用XML包抓取163体育频道中超栏目的网络表格数据
# XML包抓取网络表格数据
# readHTMLtable()函数
library(XML)
strurl <- 'http://sports.163.com/zc/'
tables <- readHTMLTable(strurl, header = FALSE, stringsAsFactors = FALSE)
# 解决中文乱码问题的方法：将数据导出到本地的txt文件，再重新导入即可：
table_sub <- tables[[1]]
write.table(table_sub, "table_sub.txt", row.names = F)
read.table("table_sub.txt", encoding = 'UTF-8', header = T)

