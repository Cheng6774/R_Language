# 第四章  # mtcars数据集为例，探究汽车行驶速度与车身重量的关系，可以用一个散点图直观展示。
# 绘图示例代码
attach(mtcars)  # 绑定数据框mtcars
plot(wt, mpg)  # 打开图形窗口，绘制散点图
detach(mtcars)  # 解除绑定数据框mtcars




# 4.1.1  # colors()函数生成657中颜色名称，代表657种颜色
colors()[1:20]  # 查看前20种颜色


par(mfrow = c(length(colors()) %/% 60 + 1, 1))
par(mar = c(0.1, 0.1, 0.1, 0.1), xaxs = "i",  yaxs = "i")
for (i in 1:(length(colors())%/%60 + 1)) {
  barplot(rep(1, 60), col = colors()[((i - 1) * 60 + 1):(i * 60)], 
          border = colors()[((i - 1) * 60 + 1):(i * 60)], axes = FALSE)
  box() 
}



# 4.1.1   # palette函数的应用示例R代码：
palette()  # 返回当前的调色板设置
palette(colors()[1:10])  # 重新设置调色板为colors()的前10种颜色
palette()  
palette("default")  # 恢复默认的调色板设置
data(mtcars)
par(mfrow = c(1, 1))
plot(mtcars$wt, mtcars$mpg, col = "blue")   
plot(mtcars$wt, mtcars$mpg, col = 4)  
attach(mtcars)    
str(mtcars)
plot(wt, mpg, col = "red", xlim = c(1.3, 5.6), ylim = c(8, 35))
points(wt[cyl == 6], mpg[cyl == 6], col = "green")
points(wt[cyl == 8], mpg[cyl == 8], col = "blue")
legend(5, 35, c(4, 6, 8), pch = 1, col = c("red", "green", "blue"), bty = "n")



# 4.1.1   # rgb函数代码
rgb <- rgb(red = 255, green = 1:255, blue = 0, max = 255)
par(mfrow = c(6, 1))
par(mar = c(0.1, 0.1, 2, 0.1), xaxs = "i", yaxs = "i")
barplot(rep(1, 255), col =  rgb, border = rgb, axes = FALSE, main = "rgb"); box()
barplot(rep(1, 100), col = rainbow(100), border = rainbow(100), axes = FALSE, 
        main = "rainbow(100))"); box()
barplot(rep(1, 100), col = heat.colors(100), border = heat.colors(100), 
        axes = FALSE, main = "heat.colors(100))"); box()
barplot(rep(1, 100), col = terrain.colors(100), border = terrain.colors(100), 
        axes = FALSE, main = "terrain.colors(100))"); box()
barplot(rep(1, 100), col = topo.colors(100), border = topo.colors(100), 
        axes = FALSE, main = "topo.colors(100))"); box()
barplot(rep(1, 100), col = cm.colors(100), border = cm.colors(100), axes = FALSE, 
        main = "cm.colors(100))"); box()



# 4.1.1   # RColorBrewer包展示图
library(RColorBrewer)
par(mar = c(0.1, 3, 0.1, 0.1), mfrow = c(1, 1))
display.brewer.all(type = "seq")



# 4.1.1   # RColorBrewer包展示图
display.brewer.all(type = "div")

display.brewer.all(type = "qual")




# 4.1.1   # 渐变色生成函数
library(RColorBrewer)
attach(mtcars) 
cl <- brewer.pal(3, "Dark2")  # 左图代码,RColorBrewer包配色方案的使用 
par(mfrow = c(1, 1))
plot(wt, mpg, col = cl[1])
points(wt[cyl == 6], mpg[cyl == 6], col = cl[2])
points(wt[cyl == 8], mpg[cyl == 8], col = cl[3])
legend(5, 35, c(4, 6, 8), pch = 1, col = cl, bty = "n")

cl <- rainbow(3)  # 右图代码，rainbow函数的使用
plot(wt, mpg, col = cl[1])
points(wt[cyl == 6], mpg[cyl == 6], col = cl[2])
points(wt[cyl == 8], mpg[cyl == 8], col = cl[3])
legend(5, 35, c(4, 6, 8), pch = 1, col = cl, bty = "n")



# 4.1.2   # 点的样式的展示代码
# 添加点
# 绘制空白画布
plot(1, col = "white", xlim = c(1, 8), ylim = c(1, 7))
symbol <- c("*", "、", ".", "o", "O", "0", " + ", " - ", "|")
# 创建循环添加点
for (i in c(0:34)) {
  x <- (i %/% 5) * 1 + 1
  y <- 6 - (i %% 5)
  if (i > 25) {
    points(x, y, pch = symbol[i - 25], cex = 1.3)
    text(x + 0.5, y + 0.1, labels = paste("pch = ", symbol[i - 25]), cex = 0.8)
  } else {
    if (sum(c(21:25) == i) > 0) { 
      points(x, y, pch = i, bg = "red", cex = 1.3)
    } else {
      points(x, y, pch = i, cex = 1.3)
    }
    text(x + 0.5, y + 0.1, labels = paste("pch = ", i), cex = 0.8)
  }
}



# 4.1.2   # 改变点的样式
attach(mtcars)  # 绑定数据框mtcars
cyl <- as.factor(cyl)
plot(wt, mpg, col = "white")
points(wt, mpg, pch = as.integer(cyl) + 1, col = as.integer(cyl) + 1)
legend(5, 35, c(4, 6, 8), pch = 2:4, col = 2:4, bty = "n")



#  使用绘图参数改变点的样式
plot(wt, mpg, pch = as.integer(cyl) + 1, col = as.integer(cyl) + 1)
legend(5, 35, c(4, 6, 8), pch = 2:4, col = 2:4, bty = "n")

detach(mtcars)  # 解除绑定数据框mtcars
