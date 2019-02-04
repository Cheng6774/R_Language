# 5.1.1 # 简单散点图
library(lattice)
xyplot(mpg ~ wt, data = mtcars, xlab = "Weight", ylab = "Miles per Gallon") 


# 5.1.1 # 查看所有设置的列表
names(trellis.par.get())
show.settings()



# 5.1.1 # 图形化显示所有的设置
displacement <- equal.count(mtcars$disp, number = 3, overlap = 0)
xyplot(mpg ~ wt | displacement, data = mtcars, 
main = "Miles per Gallon vs. Weight by Engine 
Displacement", xlab = "Weight", ylab = "Miles per Gallon", layout = c(3, 1), )



# 5.1.1 # 绘制添加回归线、光滑曲线、轴须和网格线的散点图
panel <- function(x, y) {
  panel.lmline(x, y, col = "red", lwd = 1, lty = 2)
  panel.loess(x, y)
  panel.grid(h = -1, v = -1)
  panel.rug(x, y)
  panel.xyplot(x, y)
}
xyplot(mpg ~ wt, data = mtcars, xlab = "Weight", ylab = "Miles per Gallon", 
       main = " Miles per Gallon on Weight", panel = panel)



# 5.1.1 # 以发动机气缸数量为分组变量的散点图
xyplot(mpg ~ wt, data = mtcars, groups = factor(cyl), pch = 1:3, col = 1:3, 
       main = "Miles per Gallon vs Weight by Cylinder", 
       xlab = "Weight", ylab = "Miles per Gallon", 
       key = list(space = "right", title = "Cylinder", cex.title = 1, cex = 1, 
                text = list(levels(factor(mtcars$cyl))), 
                points = list(pch = 1:3, col = 1:3)))



# 5.1.1 # 同一页面的散点图和添加条件变量的散点图
graph1 <- xyplot(mpg ~ wt, data = mtcars, xlab = "Weight", ylab = "Miles per Gallon")
graph2 <- xyplot(mpg ~ wt | displacement, data = mtcars, xlab = "Weight", 
               ylab = "Miles per Gallon", layout = c(3, 1))
plot(graph1, split = c(1, 1, 2, 1))  
plot(graph2, split = c(2, 1, 2, 1), newpage = FALSE)



# 5.1.1 # 同上
plot(graph1, position = c(0, 0, 0.5, 1))  
plot(graph2, position = c(0.5, 0, 1, 1), newpage = FALSE)



# 5.1.1 # 利用str函数查看数据结构
str(Titanic)
# 绘图对象为table数据时的条形图
barchart(Titanic, auto.key = TRUE)
# 修改图例，x轴组距自由
barchart(Titanic, layout = c(4, 1), 
         auto.key = list(title = "Survived", columns = 2), 
         scales = list(x = "free")) # 将x轴坐标设置为free
# 绘图对象为表达式，数据结构为数据框时的条形图
barchart(Class ~ Freq | Sex + Age, data = as.data.frame(Titanic), 
         groups = Survived, stack = TRUE, 
         auto.key = list(title = "Survived", columns = 2, cex = 0.6))

# x轴组距自由
barchart(Class ~ Freq | Sex + Age, data = as.data.frame(Titanic), 
         groups = Survived, stack = TRUE, 
         auto.key =  list(title = "Survived", columns = 2, cex = 0.6), 
         scales = list(x = "free"))
# 显示定制面板函数
# 将lattice的高级绘图函数创建的栅栏图存在mygraph对象中
mygraph <- barchart(Class ~ Freq | Sex + Age, data = as.data.frame(Titanic), 
                    groups = Survived, stack = TRUE, 
                    auto.key = list(title = "Survived", columns = 2, cex = 0.6), 
                    scales = list(x = "free"))
# 通过update函数给mygraph图形增加垂直网格线, 并将条形边框设置为透明色
update(mygraph, panel = function(...) {
  panel.grid(h = 0, v = -1)
  panel.barchart(..., border = "transparent")
})




# 5.1.2 # 点图
dotplot(VADeaths, pch = 1:4, col = 1:4, xlab = "Rate (per 1000)", 
        main = list("Death Rates in Virginia - 1940", cex = 0.8), 
        key = list(column = 4, text = list(colnames(VADeaths)), 
                   points = list(pch = 1:4, col = 1:4)))
dotplot(VADeaths, groups = FALSE, 
        main = list("Death Rates in Virginia - 1940", cex = 0.8), 
        xlab = "Rate (per 1000)")
dotplot(VADeaths, groups = FALSE, layout = c(1, 4), origin = 0, type = c("p", "h"), 
        main = list("Death Rates in Virginia - 1940", cex = 0.8), xlab = "Rate (per 1000)")



# 5.1.2 # 直方图
library(lattice)  
library(nutshell)
data(births2006.smpl)
histogram( ~ DBWT|DPLURAL, data = births2006.smpl, main = "Births in the United States, 2006", 
          layout = c(1, 5), xlab = "Birth weight, in grams")



# 5.1.2 # 核密度图
densityplot( ~ DBWT | DPLURAL, data = births2006.smpl, layout = c(1, 5), plot.points = FALSE, 
            main = "Births in the United States, 2006", xlab = "Birth weight, in grams")
densityplot( ~ DBWT, groups = DPLURAL, data = births2006.smpl, plot.points = FALSE, 
            main = "Births in the United States, 2006", xlab = "Birth weight, in grams", 
            lty = 1:5, col = 1:5, lwd = 1.5, 
            key = list(text = list(levels(births2006.smpl$DPLURAL)), 
                       column = 3, lines = list(lty = 1:5, col = 1:5)))



# 5.1.2 # 带状图
stripplot( ~ DBWT, data = births2006.smpl, main = "Births in the United States, 2006", 
          subset = (DPLURAL == "5 Quintuplet or highter" | DPLURAL == "4 Quadruplet"), 
          jitter.data = TRUE, xlab = "Birth weight, in grams")



# 5.1.2 # qq图
library(lattice)
qqmath( ~ height | voice.part, data = singer, prepanel = prepanel.qqmathline, 
       panel = function(x, ...) {
         panel.qqmathline(x, ...)
         panel.qqmath(x, ...)
       })
qq(voice.part ~ height, aspect = 1, data = singer, 
   subset = (voice.part  ==  "Bass 2" | voice.part  ==  "Tenor 1"))



# 5.1.2 # 箱线图
bwplot( ~ height| voice.part, data = singer, xlab = "Height (inches)")
bwplot(voice.part ~ height, data = singer, xlab = "Height (inches)")



# 5.1.2 # 散点图
xyplot(Sepal.Length ~ Sepal.Width | Species, data = iris)



# 5.1.2 # 散点图矩阵
splom(mtcars[c(1, 3:7)], groups = mtcars$cyl, pscales = 0, pch = 1:3, col = 1:3, 
      varnames = c("Miles\nper\ngallon", "Displacement\n(cu. in.)", "Gross\nhorsepower", 
                   "Rear\naxle\nratio", "Weight", "1 / 4 mile\ntime"), 
      key = list(columns = 3, title = "Number of Cylinders", 
                 text = list(levels(factor(mtcars$cyl))), 
                 points = list(pch = 1:3, col = 1:3)))





# 5.1.2 # 三维水平图
library(lattice)
data(Cars93, package = "MASS")
cor.Cars93 <-cor(Cars93[, !sapply(Cars93, is.factor)], use = "pair")
levelplot(cor.Cars93, scales = list(x = list(rot = 90)))



# 5.1.2 # 三维等高线图
contourplot(volcano, cuts = 20, label = FALSE)



# 5.1.2 # 对iris绘制三维散点图
par.set <-list(axis.line = list(col = "transparent"), clip = list(panel = "off"))
cloud(Sepal.Length ~ Petal.Length * Petal.Width, data = iris, groups = Species, 
      cex = .8, pch = 1:3, col = c("blue", "red", "green"), 
      screen = list(z = 20, x = -70, y  = 0), par.settings = par.set, 
      scales = list(col = "black"), 
      key = list(title = "Species", column = 3, text = list(levels(iris$Species)), 
               points = list(pch = 1:3, col = c("blue", "red", "green"))))



# 5.1.2 # 对volcano绘制三维曲面图
wireframe(volcano, shade = TRUE, aspect = c(61 / 87, 0.4), light.source = c(10, 0, 10))
