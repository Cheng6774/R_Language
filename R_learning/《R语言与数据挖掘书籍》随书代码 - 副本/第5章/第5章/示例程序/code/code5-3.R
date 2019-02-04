# 把“数据及程序”文件夹拷贝到F盘下，再用setwd设置工作空间
setwd("F:/数据及程序/第5章/示例程序")

# 5.3.1 # rCharts包的安装代码
require(devtools)
library(curl)
install_github('ramnathv/rCharts')



# 5.3.1 # 散点图
library(rCharts)
names(iris) <- gsub("\\.", "", names(iris))
rPlot(SepalLength ~ SepalWidth | Species, data = iris, color = 'Species', 
      type = 'point')



# 5.3.1 # 交互分组柱状图
library(rCharts)
hair_eye_male <- subset(as.data.frame(HairEyeColor), Sex == "Male")
hair_eye_male[, 1] <- paste0("Hair", hair_eye_male[, 1])
hair_eye_male[, 2] <- paste0("Eye", hair_eye_male[, 2])
nPlot(Freq ~ Hair, group = "Eye", data = hair_eye_male, type = "multiBarChart")



# 5.3.1 # 交互气泡图
a <- hPlot(Pulse ~ Height, data = MASS::survey, type = "bubble", title = "Zoomdemo", 
           subtitle = "bubblechart", size = "Age", group = "Exer")
a$colors('rgba(223,83,83,.5)', 'rgba(119,152, 91,.5)', 'rgba(60,179,113,.5)')
a$chart(zoomType = "xy")
a$exporting(enabled = T)
a



# 5.3.1 # 时间序列图。
data(economics, package = 'ggplot2')
dat <- transform(economics, date = as.character(date))
p1 <- mPlot(x = "date", y = list("psavert", "uempmed"), data = dat, 
            type = 'Line', pointSize = 0, lineWidth = 1)
p1



# 5.3.1 # 将时间序列图变成面积图
p1$set(type = "Area")
p1



# 5.3.2 # 安装代码
library(devtools)
install_github("yihui/recharts")



# 5.3.2 # 利用recharts包绘制散点图
source("./code/echartR.R")
library(recharts)
echartR(data = iris, x = ~ Sepal.Length, y = ~ Petal.Length, series = ~ Species, 
        type = 'scatter', palette = "Set1", 
        markLine = rbind(c(1, 'LinearRegCoef', 'lm', T), c(2, 'LinearRegCoef', 'lm', T), 
                       c(3, 'LinearRegCoef', 'lm', T)))



# 5.3.3 # 利用gvisMotionChart函数绘制功能强大的交互图
library(googleVis)
M1 <- gvisMotionChart(Fruits, idvar = "Fruit", timevar = "Year")
plot(M1)



# 5.3.4 # 利用leaflet函数绘制的交互地图
library(leaflet)
leaflet() %>%
  addTiles() %>%
  addMarkers(lng = 174.768, lat = -36.852, popup = "ThebirthplaceofR")



# 5.3.4 # 图 5 39利用dygraphs函数绘制的交互时序图
library(dygraphs)
LTV <- read.csv("./data/LTV.csv")
LTV.ts <- ts(LTV)
dygraph(LTV.ts, main = "LTVforecast") %>%
  dySeries("V1", label = "LTV", strokeWidth = 3) %>%
  dyOptions(colors = "red", fillGraph = TRUE, fillAlpha = 0.4) %>%
  dyHighlight(highlightCircleSize = 5, 
              highlightSeriesBackgroundAlpha = 0.2, 
              hideOnMouseOut = FALSE) %>%
  dyAxis("x", drawGrid = FALSE) %>%
  dyAxis("y", label = "LTV(LifeTimeValue)") %>%
  dyRangeSelector()



# 5.3.4 # 利用函数plot_ly绘制的交互散点图
library(plotly)
pal <- RColorBrewer::brewer.pal(nlevels(iris$Species), "Set1")
plot_ly(data = iris, x = ~ Sepal.Length, y = ~ Petal.Length, color = ~ Species, 
        colors = pal, mode = "markers")


# 5.3.4 # 由ggplot2转化的交互散点图
p <- ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, colour = Species)) +
  scale_color_brewer(palette = "Set1") +
  geom_point()
ggplotly(p)



# 5.3.4 # 交互数据表格
library(DT)
datatable(iris)



# 5.3.4 # 利用simpleNetwork绘制简单网络图
library(networkD3)
src <- c("A", "A", "A", "A", "B", "B", "C", "C", "D")
target <- c("B", "C", "D", "J", "E", "F", "G", "H", "I")
networkData <- data.frame(src, target)
simpleNetwork(networkData, zoom = T)



# 5.3.4 # 利用forceNetwork绘制力导向图
data(MisLinks)
data(MisNodes)
forceNetwork(Links = MisLinks, Nodes = MisNodes, Source = "source", Target = "target", 
             Value = "value", NodeID = "name", Group = "group", opacity = 0.8)




# 5.3.5 # 基本的网页界面布局UI代码
library(shiny)
shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
    x <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
})
# 相应的ui.R如下：
library(shiny)
shinyUI(fluidPage(
  titlePanel("Old Faithful Geyser Data"), 
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins", "Number of bins:", min = 1, max = 50, value = 30)), 
    mainPanel(
      plotOutput("distPlot")))))






# 5.3.5 # 自动生成一个网页展示结果
library(shiny)
runApp("./code/myapp")



# 5.3.5 # shinyApp执行app
library(shiny)
ui <- fluidPage(
  numericInput(inputId = "n", 
               "Samplesize", value = 25), 
  plotOutput(outputId = "hist")
)
server <- function(input, output) {
  output$hist <- renderPlot({
    hist(rnorm(input$n))
  })
}
shinyApp(ui = ui, server = server)



# 5.3.5 # 得到shinydashboard的基本框架
library(shiny)
library(shinydashboard)
ui <- dashboardPage(
  dashboardHeader(), 
  dashboardSidebar(), 
  dashboardBody()
)
server <- function(input, output) {}
shinyApp(ui, server)



# 5.3.5 # 用renderPlot()函数将图形赋予输出对象mygraph形式
# server.R #
output$mygraph <- renderPlot({
  graph_function(formula, data = ,…)
})
# ui.R #
plotOutput(“mygraph”)




# 5.3.5 # 评价线性模型拟合情况可视化
# server.R #
output$lm.fit <- renderPlot({
  fit <- lm(Sepal.Length ~ Sepal.Width, data = iris[, 1:4])
  par(mfrow = c(2, 2), pch = "*", bg = "aliceblue")
  plot(fit)
})
# ui.R #
plotOutput("lm.fit")




# 5.3.5 # 用renderChart()函数将图形赋予输出对象将图形输出到web中
# server.R #
output$mygraph <- renderChart({
  p1 <- hPlot(formula, data, type, …)
  p1$addParams(dom = ”mygraph”)
  return(p1)
})
# ui.R #
showOutput(“mygraph”, ”highcharts”)





# 5.3.5 # nPlot函数绘制的交互柱状图web展示
# server.R #
output$mychart1 <- renderChart({
  hair_eye_male <- subset(as.data.frame(HairEyeColor), Sex == "Male")
  hair_eye_male[, 1] <- paste0("Hair", hair_eye_male[, 1])
  hair_eye_male[, 2] <- paste0("Eye", hair_eye_male[, 2])
  p1 <- nPlot(Freq ~ Hair, group = "Eye", data = hair_eye_male, type = "multiBarChart")
  p1$chart(color = c('brown', 'blue', '#594c26', 'green'))
  p1$addParams(dom = "mychart1")
  return(p1)
})
# ui.R #
showOutput("mychart1", "nvd3")



# 5.3.5 # renderDataTable()函数
# server.R #
output$mytable <- renderDataTable({
  datatable(data)
})
# ui.R #
dataTableOutput(“mytable”)



# 5.3.5 #    renderForceNetwork()函数
# server.R #
output$mygraph <- renderForceNetwork({
  forceNetwork(…)
})
# ui.R #
forceNetworkOutput(“mygraph”)

