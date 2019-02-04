# 4.2	# 示例：使用par ()展示各图形组合参数用法的示例代码
# 将图形按2行3列摆放
mfrow1 <- par(mfrow = c(2, 3))
for (i in 1:6) {
  plot(c(1:i), main = paste("I'm image:", i))
}
# 改变图形边距
mar1 <- par(mar = c(4, 5, 2, 3))
for (i in 1:6) {
  plot(c(1:i), main = paste("I'm image:", i))
}
par(mar1)  # 去除par()函数mar参数的设置mar1
# 改变外边界宽度
oma1 <- par(oma = c(4, 5, 2, 3))
for (i in 1:6) {
  plot(c(1:i), main = paste("I'm image:", i))
}
par(oma1)  # 去除par()函数oma参数的设置oma1
# 改变坐标轴位置
mgp1 <- par(mgp = c(1, 2, 3))
for (i in 1:6) {
  plot(c(1:i), main = paste("I'm image:", i))
}
par(mgp1)  # 去除par()函数mgp参数的设置mgp1
par(mfrow1)  # 去除par()函数mfrow参数的设置mfrow1



# 4.2	# 示例:layout()函数版面摆放的展示图
mat <- matrix(c(1, 1, 2, 3, 3, 4, 4, 5, 5, 6), nrow = 2, byrow = TRUE)
layout(mat)
for (i in 1:6) {
  plot(c(1:i), main = paste("I'm image:", i))
}



# 4.3.1  # 输出到屏幕
windows()  # 打开图形设备界面
attach(mtcars)
plot(wt, mpg)
X11()  # 打开图形设备界面
plot(wt, mpg)



# 4.3.2  # 	示例：使用pdf()函数将图形保存为pdf格式的代码：
pdf("p.pdf")
plot(wt, mpg)    
dev.off()



# 4.4  # 以mtcars为例，生成的直方图
op <- par(mfrow = c(2, 3), mar = c(4, 4, 2, 0.5), mgp = c(2, 0.5, 0))
hist(wt, main = "freq = TRUE")  # 默认的频数直方图，左下，中上，中下，右上，右下
hist(wt, breaks = 5, main = "breaks = 5")  # 减小区间段数的直方图
hist(wt, col = "light blue", main = "colored")  # 给直方图的柱形添加颜色
hist(wt, freq = FALSE, main = "freq = FALSE")  # 概率密度直方图
hist(wt, breaks = 40, main = "breaks = 40")  # 增大区间段数的直方图
# 在直方图上添加密度曲线和正态分布概率密度曲线
hist(wt, freq = FALSE, main = "with density curve and normal curve")   
lines(density(wt), col = "blue")
lines(density(rnorm(1e+6, mean(wt), sd(wt))), lty = 2, col = "red") 
par(op) 



# 4.4  # 以mtcars为例，生成的核密度图
library(sm)  # 加载sm包
par(mfrow = c(1, 1))
sm.density.compare(wt, factor(cyl))  # 绘制核密度图
legend("topright", levels(factor(cyl)), lty = 1:3, col = 2:4, bty = "n")



# 4.4  # 以mtcars为例，绘制的箱线图见
set.seed(1234) 
normal <- rnorm(100, mean(wt), sd(wt))  # 生成100个正态分布数据
op <- par(mfrow = c(1, 3))
boxplot(list(wt, normal), xaxt = "n")  # 绘制箱线图
axis(1, at = 1:2, labels = c("wt", "normal"))  # 添加坐标轴
rug(wt, side = 2, col = 2); rug(normal, side = 4, col = 3)  # 添加坐标轴须 
legend("bottomleft", c("wt", "normal"), lty = 1, col = 2:3, bty = "n")  # 添加图例
boxplot(list(wt, normal), xaxt = "n", varwidth = TRUE)
rug(wt, side = 2, col = 2); rug(normal, side = 4, col = 3) 
axis(1, at = 1:2, labels = c("wt", "normal"))
legend("bottomleft", c("wt", "normal"), lty = 1, col = 2:3, bty = "n")
boxplot(wt ~ cyl)
rug(wt[cyl == 4], side = 2, col = 2); rug(wt[cyl == 6], side = 4, col = 3)
rug(wt[cyl == 8], side = 2, col = 4)
legend("topleft", c("4", "6", "8"), lty = 1, col = 2:4, bty = "n")
par(op)



# 4.4  # 以mtcars为例，绘制的小提琴图
# 页面分割掉1/2，为与箱线图和核密度图对比而作，小提琴图只需要第二个语句即可
par(fig = c(0, 1, 0.5, 1), mfrow = c(2, 1))
# 绘制小提琴图
library(vioplot)
vioplot(wt[cyl == 4], wt[cyl == 6], wt[cyl == 8], border = "black", 
        col = "light green", rectCol = "blue", horizontal = TRUE)
# 分割另外1/2页面
par(fig = c(0, 1, 0, .5), mar = c(0, 2, 0, 0.5) , new = TRUE)
# 绘制箱线图
boxplot(wt ~ cyl, horizontal = TRUE, pars = list(boxwex = 0.1), border = "blue")
# 在箱线图上叠加核密度图
par(fig = c(0, 0.53, 0.1, 0.2), new = TRUE)
plot(density(wt[cyl == 4], bw = 0.3), xaxt = "n", yaxt = "n", ann = FALSE, bty = "n")
par(fig = c(0.26, 0.56, 0.25, 0.35), new = TRUE)
plot(density(wt[cyl == 6], bw = 0.3), xaxt = "n", yaxt = "n", ann = FALSE, bty = "n")
par(fig = c(0.33, 1, 0.4, 0.5), new = TRUE)
plot(density(wt[cyl == 8], bw = 0.5), xaxt = "n", yaxt = "n", ann = FALSE, bty = "n")




# 4.4  # 示例：以mtcars为例，绘制的条形图，见图4 31：
bardata <- table(cyl, carb)  # 得到表格数据
pal <- RColorBrewer::brewer.pal(3, "Set1")  # 颜色调配
op <- par(mfrow = c(2, 2), mar = c(3, 3, 3, 2), mgp = c(1.5, 0.5, 0))  
barplot(bardata, col = pal, beside = TRUE, xlab = "carb")  # 分组条形图
legend("topright", c("4", "6", "8"), pch = 15, col = pal, bty = "n")
barplot(bardata, col = pal, xlab = "carb")  # 默认堆砌条形图
legend("topright", c("4", "6", "8"), pch = 15, col = pal, bty = "n")
barplot(bardata, col = pal, beside = TRUE, horiz = TRUE, ylab = "carb")  # 水平放置的条形图
legend(5.3, 26, c("4", "6", "8"), pch = 15, col = pal, bty = "n", cex  =  0.6)
barplot(bardata, col = pal, beside = TRUE, ylim = c(0, 7), xlab = "carb")     
legend("topright", c("4", "6", "8"), pch = 15, col = pal, bty = "n")
# 显示数值
text(labels = as.vector(bardata), cex = 0.7, x = c(1.5:23.5)[1:23 %% 4 > 0], 
     y = as.vector(bardata) + 0.5)
par(op)



# 4.4  # 	示例：以mtcars为例，绘制点图，见图 4 32
dotchart(bardata, bg = pal) 


# 4.4  # 示例：以mtcars为例，绘制饼图，见图4- 33
percent <- as.vector(table(cyl)) / sum(as.vector(table(cyl))) * 100  # 计算百分比
pie(table(cyl), labels = paste(c("4", "6", "8"), "cylinders:", percent, "%"))  # 画饼图



# 4.4  # 示例：用methods()查plot()的作图方法： 
methods("plot")



# 4.4  # 用plot()函数画几种图形
plot(density(wt), type = "l")
class(density(wt))  # 第一个参数density类，画核密度曲线
plot(table(cyl, vs)); class(table(cyl, vs))  # 第一个参数table类，画马赛克图
opr <- par(mfrow = c(2, 3), mar = c(4, 4, 2, 4))    
for (i in 1:6) {
  plot(lm(mpg ~ wt), i)  # 第一个参数lm类，画回归诊断图
}
par(opr); class(lm(mpg ~ wt))
plot(mtcars[, c(1, 3:7)])
class(mtcars[, c(1, 3:7)])  # 第一个参数data.frame类，画散点图矩阵



# 4.4  # 示例：绘制plot()函数的不同图形类型
x <- seq(from = 0, to = 2*pi, length = 10)  # 取10个x值
y <- sin(x)  # 计算相对应的y值
type <- c("p", "l", "b", "o", "c", "h", "s", "S", "n" )  # 图形类型向量
op <- par(mfrow = c(3, 3), mar = c(4, 4, 1, 1))
for (i in 1:9) {
  plot(x, y, type = type[i] , main = paste("type:", type[i]))
}
par(op)  



# 4.4  # 以mtcars为例，绘制散点图矩阵
# 绘图对象为公式
pairs( ~ mpg + disp + drat + wt, data = mtcars, col = as.integer(factor(cyl)) + 1, 
      main = "Scatter Plot Matrix")
# 绘图对象为数据框
pairs(mtcars[, c(1, 3, 5, 6)], col = as.integer(factor(cyl)) + 1, 
      main = "Scatter Plot Matrix")



# 4.4  # 相关图
library(corrgram)
# 相关图，主对角线上方绘制置信椭圆和平滑拟合曲线，主对角线下方绘制阴影
corrgram(mtcars, order = TRUE, upper.panel = panel.ellipse, 
         main = "Correlogram of mtcars intercorrelations")
# 相关图，主对角线上方绘制散点图，主对角线下方绘制饼图
corrgram(mtcars, order = TRUE, upper.panel = panel.pts, lower.panel = panel.pie, 
         main = "Correlogram of mtcars intercorrelations")



# 4.4  # 	示例：以mtcars为例，绘制QQ图
op <- par(mfrow = c(1, 2))
attach(mtcars)
qqnorm(wt)  # 正态分布QQ图
qqline(wt)  # QQ线
qqplot(qt(ppoints(length(wt)), df  =  5), wt, xlab  =  "Theoretical Quantiles", 
       ylab  =  "Sample Quantiles", main  =  "Q-Q plot for t dsn")  # t分布QQ图
qqline(wt)  # QQ线
par(op)



# 4.4  # 示例：以mtcars为例，绘制马赛克图
mosaicdata <- ftable(cyl, vs)  # 二维列联表
par(mfrow = c(1, 1))
mosaicplot(mosaicdata, shade = TRUE, main = "")  # 绘制马赛克图



# 4.4  # 示例：以mtcars为例，绘制星状图
pal <- RColorBrewer::brewer.pal(11, "Set1")
op <- par(mai = c(0.3, 0, 0, 0))
stars(mtcars, len = 1, key.loc = c(16, 1.5), col.segments = pal, 
      ncol = 9, main = "", draw.segments = TRUE)
par(op)



# 4.4  # 示例：以mtcars为例，绘制向日葵散点图
sunflowerplot(mpg, cyl, col = "green", seg.col = "light green")



# 4.4  # 示例：以mtcars为例，绘制等高图
mtcars1 <- data.frame(wt, mpg)  
library(KernSmooth)
est <- bkde2D(mtcars1, apply(mtcars1, 2, dpik))  # 计算二维核密度
contour(est$x1, est$x2, est$fhat, nlevels  = 15, col = "darkgreen", 
        xlab = "wt", ylab = "mpg")  # 画等高图
points(mtcars1)



# 4.4  # 示例：以mtcars为例，绘制热图
heatmap(as.matrix(mtcars), col = pal, scale = "column")
