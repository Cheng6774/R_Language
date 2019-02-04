# 4.1.3   # 	使用title()展示标题位置示例代码
# 图形添加标题
plot(c(0:5), col = "white", xlab = "", ylab = "")
title(main = list("主标题", cex = 1.5), sub = list("副标题", cex = 1.2),
      xlab = "x轴标题", ylab = "y轴标题")



# 4.1.3   # 使用text()展示字体样式、字体大小的示例代码
# 图形添加文本
# 字体
# 绘制空白画布
plot(c(0:5), col = "white")
text(2, 4, labels = "font = 1:正常字体（默认）", font = 1)
text(3, 3, labels = "font = 2:粗体字体", font = 2)
text(4, 2, labels = "font = 3:斜体字体", font = 3)
text(5, 1, labels = "font = 4:粗斜体字体", font = 4)
# 大小
plot(c(0:6), col = "white", xlim = c(1, 8))
text(2, 5, labels = "cex = 0.5:放大0.5倍", cex = 0.5)
text(3, 4, labels = "cex = 0.8:放大0.8倍", cex = 0.8)
text(4, 3, labels = "cex = 1(默认):正常大小", cex = 1)
text(5, 2, labels = "cex = 1.2:放大1.2倍", cex = 1.2)
text(6, 1, labels = "cex = 1.5:放大1.5倍", cex = 1.5)



# 4.1.3  # mtext()展示文本位置的示例代码
#图形周边添加文本
plot(c(0:5), col = "white")
mtext("side = 1:下边", side = 1, line = 2); mtext("side = 2:左边" , side = 2, line = 2)
mtext("side = 3:上边", side = 3); mtext("side = 4:右边" , side = 4) 




# 4.1.3   # 以mtcars数据集为例，将散点图变为文本字符
cyl <- as.factor(cyl)
plot(wt, mpg, col = "white", xlab = "", ylab = "")
text(wt, mpg, cyl, col = as.integer(cyl) + 1)
title(main = list("Miles per Gallon vs. Weight by Cylinder", cex = 1.5), 
      xlab = "Weight", ylab = "Miles per Gallon")

# 图形函数中直接添加图形参数，同样可得到图 4 15。
plot(wt, mpg, pch = as.character(cyl), col = as.integer(cyl) + 1, 
     xlab = "Weight", ylab = "Miles per Gallon ", 
     main = "Miles per Gallon vs. Weight by Cylinder", cex.main = 1.5)



# 4.1.4   # 示例：线的样式和线的宽度的展示代码
# 添加线
# 线的样式
data <- matrix(rep(rep(1:7), 10), ncol = 10, nrow = 7)
plot(data[1, ], type = "l", lty = 0, ylim = c(1, 8), xlim = c(-1, 10), axes = F)
text(0, 1, labels = "lty = 0")
for (i in c(2:7)) {
  lines(data[i, ], lty = i - 1)
  text(0, i, labels = paste("lty = ", i - 1))
}
# 线的宽度
data <- matrix(rep(rep(1:6), 10), ncol = 10, nrow = 6)
plot(data[1, ], type = "l", lwd = 0.5, ylim = c(1, 8), xlim = c(-1, 10), axes = F); text(0, 1, labels = "lwd = 0.5")
lines(data[2, ], type = "l", lwd = 0.8);text(0, 2, labels = "lwd = 0.8")
lines(data[3, ], type = "l", lwd = 1);text(0, 3, labels = "lwd = 1")
lines(data[4, ], type = "l", lwd = 1.5);text(0, 4, labels = "lwd = 1.5")
lines(data[5, ], type = "l", lwd = 2);text(0, 5, labels = "lwd = 2")
lines(data[6, ], type = "l", lwd = 4);text(0, 6, labels = "lwd = 4")



# 4.1.4   # 	示例代码添加参考线
# 添加参考线
# 绘制空白画布
plot(c(0:10), col = "white")
# 添加水平线
abline(h = c(2, 6, 8))
# 添加垂直线
abline(v = seq(2, 10, 2), lty = 2, col = "blue")
# 添加直线y = 2+x
abline(a = 2, b = 1)



# 4.1.4   # 示例代码   添加线段和箭头
plot(c(0:10), col = "white")
segments(2, 1, 4, 8)
arrows(4, 0, 7, 3, angle = 30)
arrows(4, 2, 7, 5, angle = 60) 




# 4.1.4   # 示例代码  添加网格线
plot(c(0:10), col = "white")  # 空白画布
grid(nx = 4, ny = 8, lwd = 1, lty = 2, col = "blue")  # 添加网格线



# 4.1.4   # 示例代码  ：添加坐标轴须
set.seed(123)  # 种子
x <- rnorm(500)  # 生成500个标准正态分布的数据
plot(density(x))  # 绘制核密度曲线
rug(x , col = "blue")  # 添加坐标轴须




# 4.1.4   # 	示例：以mtcars数据集为例查看不同的线元素函数的用用法
smpg <- (mpg - min(mpg)) / (max(mpg) - min(mpg))
plot(wt, smpg, ylab = "standardized mpg")
# 添加核密度曲线图
lines(density(wt), col = "red")
# 指向密度曲线的箭头
arrows(1.8, 0.05, 1.5, 0.1, angle = 10, cex = 0.5)
text(2, 0.05, "核密度曲线", cex = 0.6)
# 添加回归线
abline(lm(smpg ~ wt), lty = 2, col = "green")
# 指向回归直线的箭头
arrows(2, 0.5, 2, 0.7, angle = 10, cex = 0.5)
text(2, 0.45, "回归线", cex = 0.6)
# wt与mpg反向线性相关，添加最大最小值线段表现这种关系
segments(min(wt), max(smpg), max(wt), min(smpg), lty = 3, col = "blue")
# 指向最大最小值线段的箭头
arrows(3, 0.8, 2.5, 0.76, angle = 10, cex = 0.5)
text(3.3, 0.8, "最大最小值线段", cex = 0.6)
# 添加网格线作为背景
grid(nx = 4, ny = 5, lty = 2, col = "grey")

# 使用绘图参数也可也添加线条
par(mfrow = c(1, 3))
plot(density(wt), col = "red")  # 绘制核密度曲线
plot(wt, fitted(lm(smpg ~ wt)), type = "l", lty = 2, col = "green")  # 绘制回归线
plot(seq(min(wt), max(wt), length = 100), seq(max(smpg), min(smpg), length = 100), 
     type = "l", lty = 3, col = "blue")  # 绘制最大、最小值线




# 4.1.5  # 示例：使用legend()展示标题位置
local <- c("bottomright", "bottom", "bottomleft", "left", "topleft", "top", 
           "topright", "right", "center")
par(mar = c(4, 2, 4, 2), pty = 'm')
plot(c(0:10), col = "white")
legend(3, 8, "图例在(3, 8)", cex = 0.6)
legend(1, 13, "图例在(11, 11)", xpd = T, cex = 0.6)
for (i in 1:9) {
  legend(local[i], paste("图例在", local[i]), cex = 0.6)
}



# 4.1.6  # 示例：使用axis ()展示坐标轴
# 添加坐标轴
plot(c(1:12), col = "white", xaxt = "n", yaxt = "n", ann = FALSE)
axis(1, at = 1:12, col.axis = "red", 
     labels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",  "Aug", 
                "Sep", "Oct", "Nov", "Dec"))
axis(2, at = seq(1, 12, length = 10), col.axis = "red", labels = 1:10, las = 2)
axis(3, at = seq(1, 12, length = 7), col.axis = "blue", cex.axis = 0.7, 
     tck = -.01, labels = c("Mon", "Tues", "Wed", "Thu", "Fri", "Sat", "Sun")) 
axis(4, at = seq(1, 12, length = 10), col.axis = "blue", cex.axis = 0.7, 
     tck = -.01, labels = round(seq(0, 1, length = 10), 1), las = 2)
