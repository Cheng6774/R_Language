# 5.2 # 箱线图
library(ggplot2)
qplot(Species, Sepal.Length, data = iris, geom = "boxplot", fill = Species, 
      main = "依据种类分组的花萼长度箱线图")



# 5.2 # 小提琴图
qplot(Species, Sepal.Length, data = iris, geom = c("violin", "jitter"),
      fill = Species, main = "依据种类分组的花萼长度小提琴图")



# 5.2 # 散点图
qplot(Sepal.Length, Sepal.Width, data = iris, colour = Species, shape = Species, 
      main = "绘制花萼长度和花萼宽度的散点图")


# 5.2 # 分面板散点图
qplot(Sepal.Length, Sepal.Width, data = iris, geom = c("point", "smooth"), 
      facets = ~ Species, colour = Species, main = "绘制分面板的散点图")



# 5.2 # 箱线图
library(ggplot2)
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) + 
  geom_boxplot() + labs(title = "依据种类分组的花萼长度箱线图")



# 5.2 # 利用ggplot函数画出小提琴图
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +  
  geom_violin() + geom_jitter() + labs(title = "依据种类分组的花萼长度小提琴图")



# 5.2 # 对图形进行分面
data(singer, package = "lattice")
ggplot(data = singer, aes(x = height, fill = voice.part)) + 
  geom_density() + 
  facet_grid(voice.part ~ .)



# 5.2 # 分面板密度图
ggplot(data = singer, aes(x = height, fill = voice.part)) + 
  geom_density() + 
  facet_wrap( ~ voice.part, ncol = 4) + 
  theme(legend.position = "none")



# 5.2 # 利用ggplot函数改变图形颜色
# 方式一：使用scale_color_manual函数
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) + 
  scale_color_manual(values = c("orange", "olivedrab", "navy")) + 
  geom_point(size = 2)
# 方式二:使用scale_color_brewer函数
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) + 
  scale_color_brewer(palette = "Set1") + 
  geom_point(size = 2)



# 5.2 # 保存图片
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) + 
  geom_point(size = 2)
ggsave(file = "mygraph.pdf", width = 5, height = 4)
