# 安装
# install.packages("lavaan")
# 加载
library(lavaan)

# 方法一：最简化描述
# 只需指定最基本的要素即可，其他的由函数自动实现，对模型的控制力度最弱。只使用于函数cfa()和sem()
model<-'visual=~x1+x2+x3
        textual=~x4+x5+x6
        speed=~x7+x8+x9'
fit <- cfa(model, data = HolzingerSwineford1939)

# 需要注意的是，这种指定模型的方式在进行拟合时，会默认指定潜变量的第一个测量变量的因子载荷为1，如果要指定潜变量的方差为1，可以：
 model.bis <- 'visual =~ NA*x1 + x2 + x3 
               textual =~ NA*x4 + x5 + x6 
               speed =~ NA*x7 + x8 + x9 
               visual ~~ 1*visual 
               textual ~~ 1*textual 
               speed ~~ 1*speed'

# 方法二：完全描述

# 需要指定所有的要素，对模型控制力最强，适用于lavaan()函数，适合高阶使用者
model.full<- '  visual =~ 1*x1 + x2 +x3
                textual =~ 1*x4 + x5 + x6
                speed =~ 1*x7 + x8 +x9
                x1 ~~ x1
                x2 ~~ x2
                x3 ~~ x3
                x4 ~~ x4
                x5 ~~ x5
                x6 ~~ x6
                x7 ~~ x7
                x8 ~~ x8
                x9 ~~ x9
                visual ~~ visual
                textual ~~ textual
                speed ~~ speed
                visual ~~ textual +speed
                textual ~~ speed'
fit <- lavaan(model.full, data = HolzingerSwineford1939)

# 方法三：不完全描述

# 最简化和完全描述的混合版，在拟合时增加 auto.* 参数，适用于lavaan()函数
model.mixed<- '# latent variables
                visual =~ 1*x1 + x2 +x3
                textual =~ 1*x4 + x5 + x6
                speed =~ 1*x7 + x8 +x9
               # factor covariances
                visual ~~ textual + speed
                textual ~~ speed'
 fit <- lavaan(model.mixed, data = HolzingerSwineford1939, auto.var = TRUE)

#  可以设定的参数详见help帮助文档

# PS:可以在lavaan()函数里设置参数mimic="Mplus"获得与Mplus在数值和外观上相似的结果，设置mimic="EQS",输出与EQS在数值上相似的结果

# 三、拟合结果的查看
# 查看拟合结果的最简单方法是用summary()函数，例如

